class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  accepts_nested_attributes_for :cart_items
  acts_as_paranoid

end
