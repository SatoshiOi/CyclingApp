class CommentsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.build(comment_params)
    # Devise等で current_user が使える場合は下記のようにセット
    @comment.user_id = current_user.id if defined?(current_user)

    if @comment.save
      redirect_to route_path(@route), notice: "\u30B3\u30E1\u30F3\u30C8\u3092\u6295\u7A3F\u3057\u307E\u3057\u305F\u3002"
    else
      # エラー処理（バリデーションエラーなど）
      redirect_to route_path(@route), alert: "\u30B3\u30E1\u30F3\u30C8\u306E\u6295\u7A3F\u306B\u5931\u6557\u3057\u307E\u3057\u305F\u3002"
    end
  end

  # コメント削除アクション
  def destroy
    @comment = Comment.find(params[:id])
    # 本人かどうかのチェック（オプション）
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to route_path(@comment.route), notice: "\u30B3\u30E1\u30F3\u30C8\u3092\u524A\u9664\u3057\u307E\u3057\u305F\u3002"
    else
      redirect_to route_path(@comment.route), alert: "\u524A\u9664\u3059\u308B\u6A29\u9650\u304C\u3042\u308A\u307E\u305B\u3093\u3002"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
