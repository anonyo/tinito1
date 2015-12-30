class CartController < ApplicationController

  def add

    if session[:cart]
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    if cart[:product_id]
      cart[:product_id] = cart[:product_id] + 1
    else
      cart[:product_id] = 1
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