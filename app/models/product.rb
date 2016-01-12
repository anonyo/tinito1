class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :reviews
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    name_changed?
  end

end