class Favorite < ApplicationRecord
  belongs_to :account
  belongs_to :upload
  
  def next_favorite(current_account)
        current_account.favorites.where("id > ?", id).first
  end
    
    def prev_favorite(current_account)
        current_account.favorites.where("id < ?", id).last
    end
end
