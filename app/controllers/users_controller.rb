class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  before_action :require_admin_user, except: [:show]

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
    params.require(:user).permit(:name, :last_name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_admin_user
    if !current_user.admin?
      flash[:danger] = "Only that user can edit their own profile"
      redirect_to root_path
    end
  end
end