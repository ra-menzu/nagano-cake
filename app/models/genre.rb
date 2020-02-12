class Genre < ApplicationRecord
  validates :name, presence: true
  enum class_status:{有効: 0, 無効: 1}
  has_many :products
end
