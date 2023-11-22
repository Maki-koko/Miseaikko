class Admin::ReportsController < ApplicationController
  def index
    @lists = Report.all.order(created_at: :desc).page(params[:page]).per(30)
    @select = "1"
  end

  def update
    @report = Report.find(params[:id])
    
    if params[:note].present?
      @note = Note.find(params[:id])
      @note.update(note_params)
    end
    
    if params[:record].present?
      @record = Record.find(params[:id])
      @record.update(report_params)
    end
    
    if params[:comment].present?
      @comment = Comment.find(params[:id])
      @comment.update(report_params)
    end
    
    if @report.update(report_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_reports_path
    else
      flash[:alert] = "更新に失敗しました。"
      render :show
    end
  end
  
  private
  
  def report_params
    params.require(:report).permit(:reportable_type, :text, :reportable_id, :remarks, :report_status)
  end
  def note_params
    params.require(:note).permit(:hidden)
  end
  def record_params
    params.require(:record).permit(:hidden)
  end
  def comment_params
    params.require(:comment).permit(:hidden)
  end
end
