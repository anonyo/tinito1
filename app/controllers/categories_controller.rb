class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created #{@category.name}."
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
    if @category.update(category_params)
      flash[:success] = "#{@category.name} successfully updated!"
      redirect_to products_path
    else
      render "edit"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end
end