class PostController < ApplicationController
  before_action :authenticate_user!

  def write
    @posts = Post.all.reverse
  end

  def new
    @posts = Post.new
    @posts.user = current_user
    @posts.title = params[:title]
    @posts.content = params[:content]
    @posts.save

    redirect_to "/post/write"
  end

  def update
    @posts = Post.find(params[:id])
    @posts.title = params[:title]
    @posts.content = params[:content]
    @posts.save

    redirect_to '/post/write'
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy

    redirect_to '/post/write'
  end
end
