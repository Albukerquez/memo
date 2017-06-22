class ProfilesController < ApplicationController
  def edit
    @user = User.find_by(user_name: params[:user_name])
    authorize @profile
  end

  def update
    @user = User.find_by(user_name: params[:user_name])
    authorize @profile
    if @user.update(profile_params)
      flash[:success] = 'Ваш профиль был обновлён.'
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @posts = User.find_by(user_name: params[:user_name]).posts.order(created_at: :desc)
  end

  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
end
