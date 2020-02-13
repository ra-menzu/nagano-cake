class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :family_name, presence: true
  validates :last_name, presence: true
  validates :family_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postcode, presence: true
  validates :postcode, length: { is: 7}
  validates :postcode, numericality: true
  validates :street_adress, presence: true
  validates :phone_nember, presence: true
  validates :phone_nember, numericality: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  acts_as_paranoid
end


