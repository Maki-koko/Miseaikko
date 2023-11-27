class Admin::CommentsController < ApplicationController
  def index
    @comments = Report.all.where(reports: { reportable_type: 'Comment', report_status: false }).order(created_at: :desc).page(params[:page]).per(30)
  end
  
  def show
    @report = Report.find(params[:id])
    @comment = Comment.find(@report.reportable_id)
  end

  def update
    @comment = Comment.find(params[:id])
    @report = Report.find(params[:report_id])
    if @comment.update(hidden: params[:hidden])
      flash[:notice] = "更新しました"
      redirect_to admin_comment_path(id: @report.id)
    else
      render :show
    end    
  end
  

  
  private
  
  def comment_params
    params.require(:comment).permit(:hidden)
  end
end
