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
  has_many :reviews, dependent: :destroy
  has_one :payment
  accepts_nested_attributes_for :payment

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end