class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find (params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_prams)
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update
    redirect_to @post
  end

  def destroy
  end
private
  def post_prams
    params.require(:post).permit(:tytle,:body,:category)
  end
end