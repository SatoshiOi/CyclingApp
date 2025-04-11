class CommentsController < ApplicationController
  # 👇 ここに追記！ログインしてないと create/destroy は使えないようにする
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to route_path(@route), notice: "コメントを投稿しました。"
    else
      redirect_to route_path(@route), alert: "コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to route_path(@comment.route), notice: "コメントを削除しました。"
    else
      redirect_to route_path(@comment.route), alert: "削除する権限がありません。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
