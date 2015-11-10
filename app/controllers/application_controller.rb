class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def signed_in?
    current_user ? true : false
  end

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :type)
  end
end
