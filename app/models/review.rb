class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_presence_of :rating, notice: "You haven't rated this product"
  validates :comment, presence: true

end