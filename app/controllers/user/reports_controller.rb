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
    if @report.save
      flash[:notice] = "ご報告ありがとうございます。"
      redirect_to user_path(current_user)
    else
      redirect_to new_report_path
    end
  end

private

  def report_params
    params.require(:report).permit(:reportable_type, :text, :reportable_id)
  end
end
