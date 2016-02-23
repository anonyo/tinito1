class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name} and thank you for signing up."
      redirect_to products_path
    else
      render "new"
    end
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated!"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :card_number, :card_code, :card_month)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit your own profile"
    end
  end

  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
end