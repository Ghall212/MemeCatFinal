class SessionsController < ApplicationController
  def new
  end
  
  def create
    account = Account.find_by(username: params[:session][:username].downcase)
    if account && account.authenticate(params[:session][:password])
      log_in(account)
      redirect_to account
    else
      flash.now[:danger] = 'Invalid email/password combination. Please try again or create a new account.'
      render 'new'
    end
  end
  
  def destroy
      log_out
      redirect_to root_url
  end
end
