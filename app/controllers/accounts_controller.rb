class AccountsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_user, :except => [:index, :show]
  respond_to :html

  def index
    @accounts = Account.all
    respond_with(@accounts)
  end

  def show
    @account = Account.find(params[:id])
    @admin = User.find(@account.user_id)
    respond_with(@account)
  end

  def new
  @account = Account.new(:user => @user)
  respond_with(@account)
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      flash[:notice] = "Successfully created account."
    end
    redirect_to @user
  end

  def edit
    @account = Account.find(params[:id])
    respond_with(@account)
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:notice] = "Successfully updated account."
    end
    respond_with(@account)
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    flash[:notice] = "Successfully destroyed account."
    redirect_to @user
  end

  protected

    def find_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @account = Account.find(params[:id])
        @user = @account.user
      end
      unless current_user == @user
        redirect_to @user, :alert => "Are you logged in properly? You are not allowed to create or change someone else's account."
      end
    end

end
