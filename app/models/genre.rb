class Genre < ApplicationRecord
  has_many :genre, dependent: :destroy
  validates :name, :class_status, presence: true
end
