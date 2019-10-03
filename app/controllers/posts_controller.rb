class PostsController < ApplicationController
  def index
    @q=Memoir.ransack(params[:q])
    @memoirs_current=@q.result(distinct: true).includes(:user).order("created_at DESC")
    @osaka= Memoir.where("place LIKE(?)","%大阪%")
    @tokyo= Memoir.where("place LIKE(?)","%東京%")
    @hukuoka= Memoir.where("place LIKE(?)","%福岡%")
    @aiti= Memoir.where("place LIKE(?)","%愛知%")
    @kyoto= Memoir.where("place LIKE(?)","%京都%")
  end
  def popular
    @q=Memoir.ransack(params[:q])
    @memoirs_popular=@q.result(distinct: true).includes(:user).order("likes_count DESC")
    @osaka= Memoir.where("place LIKE(?)","%大阪%")
    @tokyo= Memoir.where("place LIKE(?)","%東京%")
    @hukuoka= Memoir.where("place LIKE(?)","%福岡%")
    @aiti= Memoir.where("place LIKE(?)","%愛知%")
    @kyoto= Memoir.where("place LIKE(?)","%京都%")
    @memoirs_populars = @memoirs_popular.find(Like.group(:memoir_id).order('count(memoir_id) desc').pluck(:memoir_id))
  end

  def show
    @post = Post.find(params[:id])
    # @post = Post.find(@memoir.post_id)
    @memoirs = @post.memoirs
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @memoirs_popular=Memoir.where(user_id: @post.user.id).order("likes_count DESC").limit(5)
    @memoirs_populars = []
    @memoirs_popular.each do|memoir|
      if (memoir.likes_count.to_i > 0)
        @memoirs_populars << memoir
      end
    end
  end

  def create
    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post.user_id== current_user.id
    redirect_to user_path(current_user)
  end

end
