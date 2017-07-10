class CommentController < ApplicationController
  before_action :authenticate_user!
  def write
    @comments = Comment.new
    @comments.user = current_user
    @comments.post_id = params[:id]
      if params[:content].empty?
        @comments.content = "댓글 내용이 없습니다."
      else
        @comments.content = params[:content]
      end
    @comments.save

    redirect_to '/post/write'
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy

    redirect_to '/post/write'
  end
end
