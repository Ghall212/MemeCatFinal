class Account < ApplicationRecord
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5}
    has_secure_password
    validates :password, presence: true, length: {minimum: 8}
end
