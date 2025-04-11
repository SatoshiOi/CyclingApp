class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
