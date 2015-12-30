class ReviewsController < ApplicationController
  before_action :set_review, except: [:index, :new, :create]
  before_action :set_product
  before_action :logged_in?


  def new
    if current_user
      @review = Review.where(user_id: current_user.id, product_id: params[:product_id]).first_or_initialize
      @review = Review.new(product_id: params[:id], user_id: User.find(session[:user_id]))
      session[:return_to] = nil
    else
      session[:return_to] = request.url
      redirect_to login_path, alert: "You need to login to write a review"
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    if @review.save
      flash[:success] = "Thank you for rating & reviewing #{@product.name}"
      redirect_to product_path(@product)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @review.update(review_params)
     flash[:success] = "Edited your review"
     redirect_to @product
    else
     render "edit"
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review was deleted!"
    redirect_to products_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_product
    @product = Product.friendly.find(params[:product_id])
  end
end