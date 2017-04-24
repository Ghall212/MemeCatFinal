class FavoritesController < ApplicationController
    def new
        @favorite = Favorite.new
    end
    
    def create
        @favorite = Favorite.create(favorite_params)
        @favorite.save
        redirect_to :back
    end
    
    def destroy
        @favorite = Favorite.find_by(account_id: params[:account_id], upload_id: params[:upload_id])
        @favorite.destroy
        redirect_to :back
    end
end

private
    def favorite_params
        params.require(:favorite).permit(:account_id, :upload_id)
    end