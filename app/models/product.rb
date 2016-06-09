class Product < ActiveRecord::Base
  has_many :images
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :reviews
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    name_changed?
  end
end
