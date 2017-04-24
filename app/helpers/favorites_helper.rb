module FavoritesHelper
    def not_favorited?
        Favorite.where("account_id = ? AND upload_id = ?" , current_account.id, @upload.id).take.nil?
    end
end