class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  before_action :set_user

  def create
    if current_user.follow(@user)
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    end
  end

  def destroy
    if current_user.unfollow(@user)
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
