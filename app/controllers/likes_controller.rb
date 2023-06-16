class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = @user.likes.new
    @like.user_id = @user.id
    @like.post_id = params[:post_id]
    redirect_to user_post_path(@user, @post) if @like.save
  end
end
