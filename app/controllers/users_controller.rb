class UsersController < ApplicationController
  before_action :admin_user_only, only: :index
  before_action only: [:edit, :update] do
    is_current_user?(User.find(params[:id]))
  end


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:success] = "account created!"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "user updated"
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def admin
    @user = User.find(params[:id])
    @user.update_attributes(admin: true)
    flash[:success] = "user updated"
    redirect_to users_url
  end

  def deadmin
    @user = User.find(params[:id])
    @user.update_attributes(admin: false)
    flash[:success] = "user updated"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
