class User::CommentsController < ApplicationController
  def create
      @note = Note.find(params[:note_id])
      @comment = current_user.comments.new(comment_params)
      @comment.note_id = @note.id
      @comment.score = Language.get_data(comment_params[:text])
      flash[:notice] = "コメントしました"
    if @comment.save
      redirect_to note_path(@note.id)
    else
      flash[:notice] = "コメントを入力してください"
      redirect_to note_path(@note.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to note_path(params[:note_id])
    else
      flash[:notice] = "削除できませんでした"
      redirect_to note_path(params[:note_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
