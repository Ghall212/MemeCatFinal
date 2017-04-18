class Favorite < ApplicationRecord
  belongs_to :account
  belongs_to :upload
end
