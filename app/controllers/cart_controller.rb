class CartController < ApplicationController
  before_action :require_user

  def add
    product = Product.friendly.find(params[:id])

    session[:cart] ||= {}
    product_id = product.id.to_s

    if session[:cart][product_id]
      session[:cart][product_id] += 1
    else
      session[:cart][product_id] = 1
    end

    redirect_to cart_path
  end

  def clearCart
    session[:cart] = nil
    redirect_to cart_path
  end

  def index

    if session[:cart]
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
end