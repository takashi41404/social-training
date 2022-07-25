class Admin::SocialCommentsController < ApplicationController
  def index
    @comments = SocialComment.page(params[:page])
  end

  def destroy
    @comment.destroy
    redirect_to _path
  end

end
