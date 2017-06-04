# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(show edit update destroy)

  def index
    @posts = Post.all
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
      redirect_to @post, notice: 'Пост успешно создан.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Пост успешно обновлен.'
    else
      render :edit, notice: 'Ошибка'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Пост был успешно удалён.'
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
