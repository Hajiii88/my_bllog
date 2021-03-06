class PostsController < ApplicationController
  
  before_action :set_post , only: [:show, :edit, :update, :destroy]

  def index
    # @posts =  Post.order(created_at: :desc).ransack(params[:q])
    @q = Post.order(created_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(2)
    @new_posts = Post.order(created_at: :desc).limit(5)
    @author = Author.first
  end

  def show
  end

  def new
    @post = Post.find_newest_article
  end

  def create
    
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to @post
  end
private
  def post_params
    params.require(:post).permit(:title,:body,:category)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end