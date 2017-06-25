# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i(show edit update destroy like)
  before_action :owned_post, only: %i(edit update destroy)

  def index
    @posts = Post.includes(:user, :comments).all.order(created_at: :desc).page(params[:page]).per(3)
    authorize @posts
  end

  def show; end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to @post
      flash[:success] = 'Пост успешно создан.'
    else
      flash.now[:error] = 'Ваш пост не может быть создан.'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:success] = 'Пост обновлён.'
    else
      flash.now[:error] = 'Обновить не удалось.'
      render :edit
    end
  end

  def destroy
    if @post.present?
      @post.destroy
    else
      skip_authorization
    end
    redirect_to root_path
    flash[:notice] = 'Пост был успешно удалён.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = 'Вы не можете редактировать чужие посты'
      redirect_to root_path
    end
  end
end
