class User::ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.reportable_type = params[:reportable_type]
    @report.reportable_id = params[:reportable_id]
    if params[:note_id].present?
      @note = Note.find(params[:note_id])
      @tags = @note.tags
      @report.reportable_type = "Note"
      @report.reportable_id = @note.id
    elsif params[:record_id].present?
      @record = Record.find(params[:record_id])
      @note = ""
      @report.reportable_type = "Record"
      @report.reportable_id = @record.id
    elsif params[:comment_id].present?
      @comment = Comment.find(params[:comment_id])
      @note = ""
      @report.reportable_type = "Comment"
      @report.reportable_id = @comment.id
    else
      flash[:notice] = "データが確認できませんでした。"
    end
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.score = Language.get_data(report_params[:text])
    reportable_id = params[:report][:reportable_id]
    if @report.save
      flash[:notice] = "ご報告ありがとうございます。"
      redirect_to user_path(current_user)
    else
        flash[:alert] = "コメントを入力してください。"
      if params[:report][:reportable_type]=="Note"
        redirect_to new_report_path(note_id: reportable_id)
      elsif params[:report][:reportable_type]=="Record"
        redirect_to new_report_path(record_id: reportable_id)
      elsif params[:report][:reportable_type]=="Comment"
        redirect_to new_report_path(comment_id: reportable_id)
      else
        redirect_to user_path(current_user)
      end
    end
  end

private

  def report_params
    params.require(:report).permit(:reportable_type, :text, :reportable_id)
  end
end
