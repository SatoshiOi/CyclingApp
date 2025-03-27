class RunsController < ApplicationController
  before_action :authenticate_user!

  def create
    @route = Route.find(params[:route_id])
    Run.create!(user_id: current_user.id, route_id: @route.id)
    redirect_to route_path(@route), notice: "走行記録を登録しました！"
  end
end
