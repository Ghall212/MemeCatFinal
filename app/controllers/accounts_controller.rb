class AccountsController < ApplicationController
    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        
        if @account.save
            log_in @account
            flash[:success] = "Welcome to the Meme Team!"
            redirect_to @account
        else
            render 'new'
        end
    end
    
    def show
        @account = Account.find(params[:id])
    end
    
    def edit
        @account = Account.find(params[:id])
    end
    
    def update
        @account = Account.find(params[:id])
        
        if @account.update(account_params)
            redirect_to @account
        else
            render 'edit'
        end
    end
end

private 
    def account_params
        params.require(:account).permit(:username, :password, :password_confirmation)
    end