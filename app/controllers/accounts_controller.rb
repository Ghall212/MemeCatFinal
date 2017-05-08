class AccountsController < ApplicationController
    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        
        if @account.save
            log_in @account
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
        
        if @account.update_attributes(account_params)
            redirect_to @account
        else
            render 'edit'
        end
    end
    
    def destroy
        @account = Account.find(params[:id])
        @account.destroy
        
        redirect_to root_path
    end
    
    private 
        def account_params
            params.require(:account).permit(:username, :password, :password_confirmation, :profile_pic)
        end
end