class AddScoreToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :score, :decimal, precision: 5, scale: 3
  end
end
