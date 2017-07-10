class NotificationsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to post_path @notification.post
    @notification.destroy!
  end

  def index
    @notifications = current_user.notifications.includes(:notified_by).order(created_at: :desc).page(params[:page]).per(5)
  end
end
