class Route < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :runs, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :distance, presence: true, numericality: { greater_than: 0 }
  validates :start_location, presence: true
  validates :end_location, presence: true
  validates :waypoints, presence: true
end
