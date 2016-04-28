class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {  maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates_confirmation_of :password
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates_presence_of :password_confirmation, message: "Passwords don't match."
  attr_accessor :stripe_customer_token
  has_many :reviews, dependent: :destroy
  has_one :payment
  belongs_to :plan
  accepts_nested_attributes_for :payment

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_customer_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
