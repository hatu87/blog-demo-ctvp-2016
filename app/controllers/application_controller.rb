class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def require_logged_in
    redirect_to login_path if current_user.blank?
  end

  helper_method :current_user
  def current_user
    user = User.find_by_id(session[:user_id])
  end
end
