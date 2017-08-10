class PostController < ApplicationController
  #before_action :authenticate_user!

  def write
    @posts = Post.all.reverse
  end

  def new
    @posts = Post.new
    @posts.user = current_user
    @posts.title = params[:title]
    @posts.content = params[:content]
    @posts.save

    redirect_to "/post/list"
  end
  
  def show
    @posts = Post.find(params[:id])
  
  end
  
  def list
    @posts = Post.all.reverse
  end
  
  def update
    @posts = Post.find(params[:id])
    @posts.title = params[:title]
    @posts.content = params[:content]
    @posts.save

    redirect_to "/post/show/#{params[:id]}"
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy

    redirect_to '/post/list'
  end
  
  def search
    @find_q=params[:q]
    if params[:q_value]="제목"
      @posts=Post.where("title LIKE ?","%#{@find_q}%")
    else 
      @posts=Post.where("content LIKE ?","%#{@find_q}%")
    end
  end


end
