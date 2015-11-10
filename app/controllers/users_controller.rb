class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "Please check username and/or password"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
