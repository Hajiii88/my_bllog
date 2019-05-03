class PostsController < ApplicationController
  def index
    @posts =  Post.all
    @new_posts = Post.all
    @author = Author.first
  end

  def show
    set_post
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def edit
    set_post
  end

  def update
    set_post
    @post.update
    redirect_to @post
  end

  def destroy
    set_post
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