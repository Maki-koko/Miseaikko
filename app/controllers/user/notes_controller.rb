class User::NotesController < ApplicationController

  def index
    @note = Note.includes(:user).where(users: { is_active: true }).where(notes: { status: true, hidden: true }).share.order(created_at: :desc).page(params[:page]).per(30)
    @tag_list = Tag.all
  end
  
  def new
    @note = Note.new
    @tags = ""
  end

  def create
    @note = current_user.notes.new(note_params)
      tags = params[:note][:name].split(',') # [:tag_id]を取得、splitで,を区切りに設定
    @note.user_id = current_user.id
    if @note.save
      @note.save_tags(tags)
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
  @tag_list = @note.tags.pluck(:name).join(',')
  @tags = @note.tags
  @comment = Comment.new
  # is_activeがtrueであるコメントのみを取得
  @active_comments = @note.comments.joins(:user).where(users: { is_active: true })
end

  def edit
  @note = Note.find(params[:id])
  @tags = @note.tags.pluck(:name).join(',')
  end

  def update
    @note = Note.find(params[:id])
    @tags = params[:note][:name].split(',')
    if @note.update(note_params)
      @note.save_tags(@tags)
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

  def search_tag
    # 検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    
    # 検索されたタグに紐づく投稿を表示
    @note = @tag.notes.joins(:user).where(users: { is_active: true }, notes: { status: true, hidden: true }).share.order(created_at: :desc).page(params[:page]).per(30)
  end

  
  private
  
  def note_params
    params.require(:note).permit(:user_id, :title, :content, :status)
  end
  
end
