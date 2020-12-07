class UsersController < ApplicationController
  def show
    @user = User.includes(:posts, :reactions).find_by(id: params[:id])
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end
end
