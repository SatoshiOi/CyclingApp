# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def favorites
    # 例：現在ログインしているユーザーのIDを使うならこんな書き方もできます
    # @user = current_user
    #
    # もし「ユーザーごとにURLが違う形(/profiles/:id/favorites)」にしたいなら
    # @user = User.find(params[:id])

    @favorite_routes = current_user.favorited_routes
    # ↑ ここでユーザーがお気に入り登録しているRoute一覧を取得
  end
  def show
    @user = current_user
    @routes = @user.routes.order(created_at: :desc)
    @bike = @user.bike
  end


end
