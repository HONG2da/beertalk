class PostController < ApplicationController
  skip_before_action :require_login, :only => :write

  def write
    @posts = Post.all.reverse
  end

  def new
    @posts = Post.new
    @posts.user = current_user
      if params[:title].empty? & params[:content].empty?
        @posts.title = "제목이 입력되지 않았습니다."
        @posts.content = "내용이 입력되지 않았습니다."
      elsif params[:title].empty?
        @posts.title = "제목이 입력되지 않았습니다."
        @posts.content = params[:content]
      elsif params[:content].empty?
        @posts.title = params[:title]
        @posts.content = "내용이 입력되지 않았습니다."
      end
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
