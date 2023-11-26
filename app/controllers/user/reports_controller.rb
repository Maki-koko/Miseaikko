class User::ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.reportable_type = params[:reportable_type]
    @report.reportable_id = params[:reportable_id]

    if params[:note_id].present?
      @note = Note.find(params[:note_id])
      @tags = @note.tags
      session[:reportable_type] = "Note"
      session[:reportable_id] = @note.id
    elsif params[:record_id].present?
      @record = Record.find(params[:record_id])
      session[:reportable_type] = "Record"
      session[:reportable_id] = @record.id
    elsif params[:comment_id].present?
      @comment = Comment.find(params[:comment_id])
      session[:reportable_type] = "Comment"
      session[:reportable_id] = @comment.id
    else
      flash[:notice] = "データが確認できませんでした。"
    end

    # 修正箇所: 通報対象のデータがnilの場合にエラーを表示する
    unless @note || @record || @comment
      flash[:notice] = "通報対象のデータが見つかりませんでした。"
    end
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.reportable_type = session[:reportable_type]
    @report.reportable_id = session[:reportable_id]
    if @report.save
      # 通報が成功した場合の処理
      flash[:notice] = "ご報告ありがとうございます。"
      redirect_to user_path(current_user)
      # セッションからデータを削除
      session.delete(:reportable_type)
      session.delete(:reportable_id)
    else
      # 通報が失敗した場合の処理
      render :new
    end
  end

private

  def report_params
    params.require(:report).permit(:reportable_type, :text, :reportable_id)
  end
end
