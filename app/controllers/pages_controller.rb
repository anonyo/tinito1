class PagesController < ApplicationController

  def home
    redirect_to products_path if logged_in?
  end

  def how_it_works

  end

  def faq

  end
end