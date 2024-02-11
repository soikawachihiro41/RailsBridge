class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'コメントが追加されました。'
    else
      redirect_to @post, alert: 'コメントの追加に失敗しました。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post, notice: 'コメントが削除されました。'
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
