class Favorite < ApplicationRecord
  belongs_to :account
  belongs_to :upload
  
  def next
        Favorite.where("id > ?", id).first
  end
    
    def prev
        Favorite.where("id < ?", id).last
    end
end
