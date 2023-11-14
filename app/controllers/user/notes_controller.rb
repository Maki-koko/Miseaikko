class User::NotesController < ApplicationController
  def index
    @note = Note.includes(:user).order(created_at: :desc)
  end
  
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:notice] = "ノートを保存しました"
      redirect_to note_path(@note.id)
    else
    # エラーの場合は戻る
      render :new
    end
  end

  def show
  @note = Note.find(params[:id])
  @user = @note.user
  @comment = Comment.new
  end

  def edit
  @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "ノートを保存しました"
      redirect_to note_path(@note.id)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @note = Note.find(params[:id])
    if @note.destroy
    flash[:notice] = "ノートを削除しました"
    redirect_to user_path(@user.id)
    else
    flash[:notice] = "削除できませんでした"
    render :show
    end
  end
  
  private
  
  def note_params
    params.require(:note).permit(:user_id, :title, :category, :content)
  end
  
end
