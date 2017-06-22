class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @post.comments.order(created_at: :asc)

    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to request.referer || root_path }
        format.js
      end
    else
      flash[:error] = 'Проверьте поле ввода, что то пошло не так'
      redirect_to request.referer || root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to request.referer || root_path }
        format.js
      end
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
