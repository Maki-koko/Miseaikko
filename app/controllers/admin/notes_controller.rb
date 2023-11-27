class Admin::NotesController < ApplicationController
  def index
    @notes = Report.all.where(reports: { reportable_type: 'Note', report_status: false }).order(created_at: :desc).page(params[:page]).per(30)
  end

  def show
    @report = Report.find(params[:id])
    @note = Note.find(@report.reportable_id)
    @tags = @note.tags
  end

  def update
    @note = Note.find(params[:id])
    @report = Report.find(params[:report_id])
    if @note.update(hidden: params[:hidden])
      flash[:notice] = "更新しました"
      redirect_to admin_note_path(id: @report.id)
    else
      render :show
    end    
  end
  

  private
  
  def note_params
    params.require(:note).permit(:hidden)
  end
end
