module SessionsHelper
  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
    @current_user
  end

  def logged_in?
    !!current_user
  end

  def is_current_user?(user)
    logged_in? && current_user == user
  end

  def logged_in_user
    unless logged_in?
      flash[:errors] = ['please log in or sign up']
      redirect_to root_url
    end
  end

  def admin_user?
    logged_in? && current_user.admin
  end

  def admin_user_only
    unless admin_user?
      flash[:errors] = ['insufficient permissions']
      redirect_to root_url
    end
  end

  def admin_or_correct_user(user)
    unless is_current_user?(user) || admin_user?
      flash[:errors] = ["Not yours to mess with"]
      redirect_to root_url
    end
  end

  # friendly redirecting not quite working

  def redirect_back
    redirect_to(session[:forwarding_url] || root_url)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url
  end

end
