class ReactionsController < ApplicationController
  def create
    reaction = Reaction.find_by(
      user_id: current_user.id, 
      post_id: params[:id]
    )

    reaction.destroy if reaction.present?

    if reaction&.reaction_type.to_s != reaction_params[:reaction_type] || reaction.blank?
      Reaction.create!(reaction_params)
    end

    respond_to do |format|
      @post = Post.includes(:reactions).find(params[:id])
      format.js
    end
  end

  private
    def reaction_params
      params.require(:reaction).permit(:reaction_type).merge(user_id: current_user.id, post_id: params[:id])
    end
end
