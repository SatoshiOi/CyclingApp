class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :routes
  has_many :routes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # throughオプションを使って「お気に入りしたルート」を取得できるように
  has_many :favorited_routes, through: :favorites, source: :route

  has_many :comments, dependent: :destroy
  has_many :runs, dependent: :destroy

  has_one :bike, dependent: :destroy

end
