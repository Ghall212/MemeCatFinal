class Account < ApplicationRecord
    mount_uploader :profile_pic, ImageUploader
    has_many :uploads, dependent: :destroy
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5}, allow_nil: true
    validates :password, presence: true, length: {minimum: 8}, allow_nil: true
    has_secure_password
    
    has_many :favorites, dependent: :destroy
    
    def next
        current_account.uploads.where("id > ?", id).first
    end
    
    def prev
        current_account.uploads.where("id < ?", id).last
    end
end
