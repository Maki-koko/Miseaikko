class Admin::RecordsController < ApplicationController
  def index
    @records = Report.all.where(reports: { reportable_type: 'Record', report_status: false }).order(created_at: :desc).page(params[:page]).per(30)
  end

  def show
    @report = Report.find(params[:id])
    @record = Record.find(@report.reportable_id)
  end

  def update
    @record = Record.find(params[:id])
    @report = Report.find(params[:report_id])
    if @record.update(hidden: params[:hidden])
      flash[:notice] = "更新しました"
      redirect_to admin_record_path(id: @report.id)
    else
      render :show
    end    
  end
  
  private
  
  def record_params
    params.require(:record).permit(:hidden)
  end
end