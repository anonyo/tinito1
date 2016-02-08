class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_action :require_admin_user, except: [:index, :show]

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 12)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "You have successfully created #{@product.name}"
      redirect_to products_path
    else
      render "edit"
    end
  end

  def show
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
     # @category = Category.where(category: @category.name)

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "#{@product.name} was updated successfully."
      redirect_to product_path(@product)
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "#{@product.name} was deleted!"
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :retail, category_ids: [])
  end

  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def require_admin_user
    if !current_user.admin?
      flash[:danger] = "Only admins can perform that action"
      redirect_to root_path
    end
  end
end