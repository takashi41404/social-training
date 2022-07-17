class Public::SocialCommentsController < ApplicationController

  def create
    record = Record.find(params[:record_id])
    @comment = current_user.social_comments.new(social_comment_params)
    @comment.record_id = record.id
    @comment.save
#    redirect_to record_path
  end

  def destroy
    @comment = SocialComment.find(params[:id])
    @comment.destroy
  end

  private
  def social_comment_params
    params.require(:social_comment).permit(:comment)
  end

end
