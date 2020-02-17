class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :delivery_addresses, dependent: :destroy
  has_many :ordered_items,through: :orders
  acts_as_paranoid

#   validates :email,presence: true
#   validates :family_name,presence: true
#   validates :last_name,presence: true
#   validates :family_name_kana,presence: true
#   validates :last_name_kana,presence: true
#   validates :postcode,presence: true
#   validates :street_adress,presence: true
#   validates :phone_nember,presence: true
end


