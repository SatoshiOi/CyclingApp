class Route < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  # 「お気に入り登録したユーザー」を取得する関連付け
  has_many :favorited_by, through: :favorites, source: :user

  has_many :comments, dependent: :destroy
  has_many :runs, dependent: :destroy

  has_one_attached :image

end
