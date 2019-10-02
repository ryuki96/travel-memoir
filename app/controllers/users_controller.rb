class UsersController < ApplicationController
  def index
  end

  def edit
  end
  def show
    @memoirs = Memoir.where(user_id: params[:id]).order("created_at DESC")
    @memoirs_popular=Memoir.where(user_id: params[:id]).order("likes_count DESC").limit(5)
    @memoirs_populars = []
    @memoirs_popular.each do|memoir|
      if (memoir.likes_count.to_i > 0)
        @memoirs_populars << memoir
      end
    end
    @user = User.find(params[:id])
    if Profile.find_by(user_id: @user.id).present?
      @profile =  Profile.find_by(user_id: @user.id)
    else
      @profile = Profile.create(user_id: @user.id)
    end
  end
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  def profile
    @user = User.find(current_user.id)
  end
  def user_liked
    @memoirs_popular=Memoir.where(user_id: params[:id]).order("likes_count DESC").limit(5)
    @memoirs_populars = []
    @memoirs_popular.each do|memoir|
      if (memoir.likes_count.to_i > 0)
        @memoirs_populars << memoir
      end
    end
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    if Profile.find_by(user_id: @user.id).present?
      @profile =  Profile.find_by(user_id: @user.id)
    else
      @profile = Profile.create(user_id: @user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:id,:name, :email)
  end
  def profile_params
    params.require(:profile).permit(:image,:text,:back_image).merge(user_id: current_user.id)
  end
end
