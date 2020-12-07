class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: [:index, :new, :create]
  before_action :check_ownership, except: [:index, :new, :create, :show]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_url(@comment.post) }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@comment.post) }
      end
    end
  end

  def delete
    respond_to do |format|
      format.js { render :delete }
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to post_url(@comment.post) }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge(user: current_user, post: @post)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def check_ownership
      return head(403) if @comment.user_id != current_user.id
    end

end
