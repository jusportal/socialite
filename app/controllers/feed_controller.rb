class FeedController < ApplicationController
  before_action :redirect_to_feed

  def index
    @post = Post.new
    @posts = Post.includes(:user, :reactions).order(created_at: :desc)

    respond_to do |format|
      format.html 
    end
  end

  def redirect_to_feed
    return redirect_to new_user_session_url if current_user.nil?
  end
end
