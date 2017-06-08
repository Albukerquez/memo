class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'Вы успешно оставили комментарий'
      redirect_to :back
    else
      flash[:error] = 'Проверьте поле ввода, что то пошло не так'
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @commen.destroy
    flash[:success] = 'Комментарий удалён.'
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
