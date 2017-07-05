class PostController < ApplicationController
  def write
    @posts = Post.all.reverse
  end

  def new
    @posts = Post.new
    @posts.title = params[:title]
    @posts.content = params[:content]
    @posts.save

    redirect_to "/post/write"
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
