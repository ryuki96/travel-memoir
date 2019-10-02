class CommentsController < ApplicationController
  def create
    @comment=Comment.create(text: comment_params[:text], post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to post_path(params[:memoir_id])  }
      format.json
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
