class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :route, counter_cache: true

   # 同じユーザーが同じルートを重複してお気に入り登録できないようにする
   validates :user_id, uniqueness: { scope: :route_id }
end
