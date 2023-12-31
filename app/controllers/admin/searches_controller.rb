class Admin::SearchesController < ApplicationController
  def index
    @value = params[:text] 
    if params[:text] == ""
      if params[:status] == "1"
        @lists = Report.all.order(created_at: :desc).page(params[:page]).per(30)
        @select = "1"
        @select = "1"
      elsif  params[:status] == "true"
        @lists = Report.where(report_status: true).order(created_at: :desc).page(params[:page]).per(30)
        @select = "true"
      else
        @lists = Report.where(report_status: false).order(created_at: :desc).page(params[:page]).per(30)
        @select = "false"
      end
    else
      if params[:status] == "1"
        reports = Report.all
        @lists = reports.search_by_user_name_or_email(params[:text]).order(created_at: :desc).page(params[:page]).per(30)
        @select = "1"
      elsif  params[:status] == "true"
         reports =  Report.where(report_status: true)
        @lists =   reports.search_by_user_name_or_email(params[:text]).order(created_at: :desc).page(params[:page]).per(30)
        @select = "true"
      else
         reports = Report.where(report_status: false)
         @lists = reports.search_by_user_name_or_email(params[:text]).order(created_at: :desc).page(params[:page]).per(30)
        @select = "false"
      end
    end
  end
end
