class CartController < ApplicationController

  def add
    id = params[:id]

    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    if cart[id]
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end

    redirect_to cart_path
  end

  def clearCart
    session[:cart] = nil
    redirect_to cart_path
  end

  def index
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
end