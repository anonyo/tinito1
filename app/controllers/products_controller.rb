class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
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
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end