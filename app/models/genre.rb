class Genre < ApplicationRecord
  validates :name, presence: true
  enum class_status:{有効: 0, 無効: 1}
end
