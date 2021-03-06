class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path
    else
      flash.now[:danger] = "Unable to create account."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @sent = @user.sent_compliments
    @received = @user.received_compliments
    @compliment = Compliment.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      flash[:danger] = "Unable to update profile."
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
