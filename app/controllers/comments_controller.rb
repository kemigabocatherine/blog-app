class CommentsController < ApplicationController
   def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(comment_params)
    @comment.user_id = @user.id
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to user_post_path(@user.id, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
