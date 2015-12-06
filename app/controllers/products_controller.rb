class ProductsController < ApplicationController

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

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end