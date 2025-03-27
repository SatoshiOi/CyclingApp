# app/controllers/routes_controller.rb

class RoutesController < ApplicationController
  # ① 一覧表示
  before_action :authenticate_user!, only: [ :edit, :update, :destroy ]
  # 作成者のみ編集・削除を許可
  before_action :authorize_user, only: [ :edit, :update, :destroy ]
  def index
    @routes = Route.all
  end

  # ② 詳細表示
  def show
    @route = Route.find(params[:id])
  end

  # ③ 新規作成フォーム
  def new
    @route = Route.new
  end

  # ④ データベースに新規保存
  def create
    @route = current_user.routes.build(route_params)
    if @route.save
      redirect_to @route, notice: "ルートが作成されました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # ⑤ 編集フォーム
  def edit
    @route = Route.find(params[:id])
  end

  # ⑥ 更新
  def update
    @route = Route.find(params[:id])
    if @route.update(route_params)
      redirect_to route_path(@route), notice: "ルートを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ⑦ 削除
  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to routes_path, notice: "ルートを削除しました。"
  end

  # -----------------------
  private

  # ⑧ Strong Parameters
  def route_params
    params.require(:route).permit(:title, :description, :distance, :start_location, :end_location,
    :latitude, :longitude, :start_lat, :start_lng, :end_lat, :end_lng)
  end

  def authorize_user
    route = Route.find(params[:id])
    unless route.user == current_user
      flash[:alert] = "このルートを編集する権限がありません"
      redirect_to routes_path
    end
  end
end
