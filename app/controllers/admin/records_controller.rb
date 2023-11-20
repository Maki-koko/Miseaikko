class Admin::RecordsController < ApplicationController
  def index
    @records = Report.all.where(reports: { reportable_type: 'Record', report_status: false })
  end

  def show
    @record = Record.find(params[:id])
    @report = Report.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:notice] = "更新しました"
      redirect_to admin_record_path(@record.id)
    else
      render :show
    end    
  end
  
  private
  
  def record_params
    params.require(:record).permit(:hidden)
  end
end
