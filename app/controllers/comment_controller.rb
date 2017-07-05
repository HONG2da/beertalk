class CommentController < ApplicationController
  def write
    @comments = Comment.new
    @comments.content = params[:content]
    @comments.post_id = params[:id]
    @comments.save

    redirect_to '/post/write'
  end
end
