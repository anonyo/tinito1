class CartController < ApplicationController
  before_action :require_user

  def add
    product = Product.friendly.find(params[:id])

    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    if cart[product.id]
      cart[product.id] = cart[product.id] + 1
    else
      cart[product.id] = 1
      redirect_to cart_path
    end



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