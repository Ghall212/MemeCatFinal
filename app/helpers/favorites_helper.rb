module FavoritesHelper
    def not_favorited? upload_id
        Favorite.where("account_id = ? AND upload_id = ?" , current_account.id, upload_id).take.nil?
    end
end