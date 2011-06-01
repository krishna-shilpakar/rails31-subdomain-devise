class UsersController < ApplicationController
  
  def index
    @users = current_account.nil? ? User.all : current_account.users
  end

  def show
    @user = User.find(params[:id])
    if !current_account.nil?
      is_account_resource?(@user.account_id)
    end
  end
  
  def valid
    token_user = User.valid_token?(params)
    if token_user
      sign_in(:user, token_user)
      flash[:notice] = "You have been logged in"
    else
      flash[:alert] = "Login could not be validated"
    end
    redirect_to :root
  end
end
