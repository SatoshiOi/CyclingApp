puts "==== indexアクションが呼ばれたよ！ ===="

class BikesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Rails.logger.debug "==== indexアクション呼ばれたよ！ ===="
    @bikes = Bike.includes(:user).with_attached_image
    # Rails.logger.debug "バイク数：#{@bikes.size}"
  end

  def destroy
    @bike = current_user.bike
    @bike.destroy
    redirect_to bikes_path, notice: "自転車を削除しました！"
  end

  def new
    @bike = current_user.build_bike
  end

  def create
    @bike = current_user.build_bike(bike_params)
    if @bike.save
      redirect_to bike_path, notice: "自転車を登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bike = current_user.bike
  end

  def edit
    @bike = current_user.bike
    redirect_to new_bike_path, alert: "まずは自転車を登録してね！" if @bike.nil?
  end

  def update
    @bike = current_user.bike
    if @bike.update(bike_params)
      redirect_to bike_path, notice: "更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:image, :description)
  end


end
