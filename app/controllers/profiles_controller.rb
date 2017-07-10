class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :owned_profile, only: %i(edit update)
  skip_after_action :verify_authorized

  def show
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def edit; end

  def update
    if @user.update(profile_params)
      flash[:success] = 'Ваш профиль был обновлён.'
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def owned_profile
    @user = User.find_by(user_name: params[:user_name])
    unless current_user == @user
      flash[:alert] = 'Этот профиль вам не ваш!'
      redirect_to root_path
    end
  end
end
