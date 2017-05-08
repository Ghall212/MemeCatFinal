class Upload < ApplicationRecord
  belongs_to :account
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  
  has_many :favorites, dependent: :destroy
  has_many :accounts, :through => :favorites
  
  def next
    Upload.where("id > ?", id).first
  end

  def prev
    Upload.where("id < ?", id).last
  end

  private
    def image_size_validation
      errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
    end
end
