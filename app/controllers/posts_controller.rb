class PostsController < ApplicationController
  def index
    @posts =  Post.all
    @new_posts = Post.all
    @author = Author.first
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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end
private
  def post_prams
    params.require(:post).permit(:title,:body,:category)
  end
end