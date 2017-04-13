class Upload < ApplicationRecord
  belongs_to :account
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  
  def next
    Upload.where("id > ?", id).first
  end

  def prev
    Upload.where("id < ?", id).last
  end

  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
