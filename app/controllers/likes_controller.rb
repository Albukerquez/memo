class LikesController < ApplicationController
  before_action :set_post
  # respond_to :js
  skip_after_action :verify_authorized

  def like
    @user = current_user
    @user.like!(@post)
    respond_to do |format|
      format.html { redirect_to request.referer || root_path }
      format.js
    end
  end

  def unlike
    @user = current_user
    @like = @user.likes.find_by(post_id: params[:post_id])
    @like.destroy!
    respond_to do |format|
      format.html { redirect_to request.referer || root_path }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
