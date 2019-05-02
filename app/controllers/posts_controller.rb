class PostsController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end
private
  def post_prams
    params.require(:post).permit(:tytle,:body,:category)
  end
end