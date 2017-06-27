class LikesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def like
    @user = current_user
    create_notification @post
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

  def create_notification(post)
    return if post.user.id == current_user.id
    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        identifier: post.id,
                        notice_type: 'like')
  end
end
