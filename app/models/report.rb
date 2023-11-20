class Report < ApplicationRecord

  # belongs_to :comment
  # belongs_to :note
  belongs_to :report, polymorphic: true, optional: true
  # polymorphic: true→Reportモデルが（Note、Comment、Record）モデルと
  # 関連付けられるようにする設定
  # optional: true→関連づくReportsがなくても保存可にする

  #enum type: { note: 0, comment: 1, record: 2 }

end
