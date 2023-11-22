class Report < ApplicationRecord

  # belongs_to :comment
  # belongs_to :note
  belongs_to :reportable, polymorphic: true, optional: true
  # polymorphic: true→Reportモデルが（Note、Comment、Record）モデルと
  # 関連付けられるようにする設定
  # optional: true→関連づくReportsがなくても保存可にする

  #enum type: { note: 0, comment: 1, record: 2 }
  scope :search_by_user_name_or_email, ->(query) {
    joins("LEFT JOIN notes ON reports.reportable_id = notes.id AND reports.reportable_type = 'Note'")
      .joins("LEFT JOIN comments ON reports.reportable_id = comments.id AND reports.reportable_type = 'Comment'")
      .joins("LEFT JOIN records ON reports.reportable_id = records.id AND reports.reportable_type = 'Record'")
      .joins("LEFT JOIN users ON users.id = notes.user_id OR users.id = comments.user_id OR users.id = records.user_id")
      .where("users.name LIKE ? OR users.email LIKE ?", "%#{query}%", "%#{query}%")
  }
end
