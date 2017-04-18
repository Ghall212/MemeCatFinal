class Account < ApplicationRecord
    has_many :uploads
    has_and_belongs_to_many :favorites
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5}
    validates :password, presence: true, length: {minimum: 8}
    has_secure_password
    
    def next
        current_account.uploads.where("id > ?", id).first
    end
    
    def prev
        current_account.uploads.where("id < ?", id).last
    end
end
