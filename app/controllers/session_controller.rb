class SessionController < ApplicationController
  def new
    redirect_to root_path if session[:user_id] != nil

    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Incorrect username and/or password"
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
