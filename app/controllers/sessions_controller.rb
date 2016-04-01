class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:session][:email], params[:session][:password])

    if user.nil?
      flash.now[:errors] = ["invalid credentials"]
      @email = params[:session][:email]
      render :new
    else
      login!(user)
      flash[:success] = "welcome back"
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    flash[:success] = "logged out"
    redirect_to root_url
  end
end
