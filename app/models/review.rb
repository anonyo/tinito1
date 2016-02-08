class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_presence_of :rating, notice: "You haven't rated this product"
  validates :comment, presence: true
  validates :user_id, :uniqueness => { :scope => :product_id, :message => "Users may only write one review per product." }

end