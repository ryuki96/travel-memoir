class MemoirsController < ApplicationController
    before_action :authenticate_user!,except:[:index,:show]
    def index
      @memoir = Memoir.create( place: memoir_params[:place], image: memoir_params[:image], text: memoir_params[:text],post_id: params[:post_id], user_id: current_user.id )
      redirect_to user_path(current_user)
    end

    def new
      if user_signed_in?
        if Profile.find_by(user_id: current_user.id).blank?
          @profile = Profile.create(user_id: current_user.id)
        end
        @posts = Post.where(user_id: current_user.id)
        @posts.each do |post|
          @memoirs = post.memoirs
          if @memoirs== []
            post.destroy
          end
        end
      end
      @memoir = Memoir.new
      @post = Post.create(user_id: current_user.id)
    end

    def add
      @memoir = Memoir.new
      @post =Post.find(params[:post_id])
      if @post.user.id != current_user.id
        redirect_to root_path
      end
    end
    def create
      @post =Post.find(params[:post_id])
      @memoir = Memoir.create( place: memoir_params[:place], image: memoir_params[:image], text: memoir_params[:text],post_id: params[:post_id], user_id: current_user.id )
      @memoir = Memoir.new
    end

    def show
      @memoir = Memoir.find(params[:id])
      @post = Post.find(@memoir.post_id)
      @comment = Comment.new
      @comments = @post.comments.includes(:user)
      @memoirs_popular=Memoir.where(user_id: @memoir.user.id).order("likes_count DESC").limit(5)
      @memoirs_populars = []
      @memoirs_popular.each do|memoir|
        if (memoir.likes_count.to_i > 0)
          @memoirs_populars << memoir
        end
      end
    end

    def edit
      @memoir = Memoir.find(params[:id])
      if @memoir.user.id != current_user.id
        redirect_to root_path
      end
    end
    
    def update
      @memoir = Memoir.find(params[:id])
      if @memoir.user.id != current_user.id
        redirect_to root_path and return
      end
      if @memoir.update(memoir_params)
        redirect_to memoir_path(@memoir.id)
      end
    end

    def destroy
      @memoir = Memoir.find(params[:id])
      @memoir.destroy if @memoir.user_id== current_user.id
      redirect_to user_path(current_user)
    end
    private
    def memoir_params
      params.require(:memoir).permit(:place,:image,:text).merge(user_id: current_user.id)
    end
end
