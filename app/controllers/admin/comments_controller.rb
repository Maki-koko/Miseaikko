class Admin::CommentsController < ApplicationController
  def index
    @comments = Report.all.where(reports: { reportable_type: 'Comment', report_status: false }).page(params[:page]).per(30)
  end
  
  def show
    @report = Report.find(params[:id])
    @comment = Comment.find(@report.reportable_id)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "更新しました"
      redirect_to admin_comment_path(@comment.id)
    else
      render :show
    end    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:hidden)
  end
end
