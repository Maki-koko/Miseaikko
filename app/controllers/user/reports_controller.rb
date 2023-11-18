class User::ReportsController < ApplicationController
  def new
    @note = Note.find(params[:id])
    @report = Report.new
    @report.reportable_type = params[:reportable_type]
    @report.reportable_id = params[:reportable_id]
  end

  def create
  end
end
