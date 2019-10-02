class ProfilesController < ApplicationController
  before_action :set_profile
  def edit
    if params[:user_id].to_i == current_user.id
      @user =User.find(current_user.id)
      if @profile.present?
        @profile =  Profile.find_by(user_id: @user.id)
      else
        @profile = Profile.create(user_id: @user.id)
      end
    else
      redirect_to root_path
    end
  end
  def update
    if @profile.user_id ==current_user.id
      @profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      redirect_to posts_path
    end
  end
  def destroy
    @profile.destroy if @profile.user_id== current_user.id
    redirect_to edit_user_profile_path(current_user)
  end

  private

  def profile_params
    params.require(:profile).permit(:image,:text,:back_image).merge(user_id: current_user.id)
  end
  def set_profile
    @profile =Profile.find_by(user_id: current_user.id)
  end
end
