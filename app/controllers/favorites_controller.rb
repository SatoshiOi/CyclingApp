class FavoritesController < ApplicationController
  before_action :authenticate_user!  # ログインしていないと操作できないようにする

  def create
    route = Route.find(params[:route_id])
    favorite = current_user.favorites.build(route: route)

    if favorite.save
      flash[:notice] = "お気に入りに登録しました。"
    else
      flash[:alert] = "お気に入り登録に失敗しました。"
    end
    redirect_to route_path(route)
  end

  def destroy
    route = Route.find(params[:route_id])
    favorite = current_user.favorites.find_by(route_id: route.id)

    if favorite&.destroy
      flash[:notice] = "お気に入りを解除しました。"
    else
      flash[:alert] = "お気に入り解除に失敗しました。"
    end
    redirect_to route_path(route)
  end

  def index
    @favorites = current_user.favorites
  end
end
