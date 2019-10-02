class LikesController < ApplicationController
  before_action :set_variables
  def create
    like = current_user.likes.new(memoir_id: @memoir.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(memoir_id: @memoir.id)
    like.destroy
  end

  private

  def set_variables
    @memoir = Memoir.find(params[:memoir_id])
    @id_name = "#like-link-#{@memoir.id}"
    @id_heart = "#heart-#{@memoir.id}"
  end
end
