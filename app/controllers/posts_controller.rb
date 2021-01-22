class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to action: "index"

    else
      render :new

    end
  end


    private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:author, :body)
      end
end
