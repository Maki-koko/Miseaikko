class Admin::HomesController < ApplicationController
  def top
    note_reports = Report.where(reportable_type: 'Note')
    @notes = Note.joins(:reports).where(reports: { reportable_type: 'Note', report_status: false })
    
    record_reports = Report.where(reportable_type: 'Record')
    @records = Record.joins(:reports).where(reports: { reportable_type: 'Record', report_status: false })
    
    comment_reports = Report.where(reportable_type: 'Comment')
    @comments = Comment.joins(:reports).where(reports: { reportable_type: 'Comment', report_status: false })

  end
end
