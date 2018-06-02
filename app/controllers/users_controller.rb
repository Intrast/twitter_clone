class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
     @users =User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to log_in_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)

      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
