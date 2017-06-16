class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
      flash[:success] = 'Вы успешно оставили комментарий'
      redirect_to request.referer || root_path
    else
      flash[:error] = 'Проверьте поле ввода, что то пошло не так'
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    authorize @comment
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    flash[:success] = 'Комментарий удалён.'
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
