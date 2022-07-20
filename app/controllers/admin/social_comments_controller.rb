class Admin::SocialCommentsController < ApplicationController
  def index
    @comments = SocialComment.all
  end
  
  def destroy
    @comment.destroy
    redirect_to _path
  end
  
end
