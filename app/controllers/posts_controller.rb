class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
  before_action :check_ownership, except: [:index, :new, :create, :show]

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
    
    respond_to do |format|
      format.js
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_to do |format|
        format.html { redirect_to :root }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url }
      end
    end
  end

  def delete
    respond_to do |format|
      format.js { render :delete }
    end
  end

  def destroy
    if @post.destroy
      redirect_to :root, notice: "Post was successfully deleted."
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :photo).merge(user: current_user)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def check_ownership
      return head(403) if @post.user_id != current_user.id
    end
end
