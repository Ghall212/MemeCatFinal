class FavoritesController < ApplicationController
    def new
        @favorite = Favorite.new
    end
    
    def create
        @favorite = Favorite.create(favorite_params)
        @favorite.save
        redirect_to :back
    end
    
    def show
        @favorite = Favorite.find(params[:id])
    end
    
    def destroy
        @favorite = Favorite.find_by(account_id: params[:account_id], upload_id: params[:upload_id])
        @favorite.destroy
        if params[:on_favorite] == false
            redirect_to @next
        else
            if current_account.favorites.count == 0
                redirect_to current_account
            elsif @favorite.next_favorite(current_account) != nil
                redirect_to @favorite.next_favorite(current_account)
            elsif @favorite.prev_favorite(current_account) != nil
                redirect_to @favorite.prev_favorite(current_account)
            end
        end
    end
end

private
    def favorite_params
        params.require(:favorite).permit(:account_id, :upload_id)
    end