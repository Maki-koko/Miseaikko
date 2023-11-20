class Admin::NotesController < ApplicationController
  def index
    @notes = Report.all.where(reports: { reportable_type: 'Note', report_status: false })
  end

  def show
    @note = Note.find(params[:id])
    @report = Report.find(params[:id])
    @tags = @note.tags
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "更新しました"
      redirect_to admin_note_path(@note.id)
    else
      render :show
    end    
  end


  private
  
  def note_params
    params.require(:note).permit(:hidden)
  end
end
