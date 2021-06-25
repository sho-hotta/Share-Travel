class ChangeDatatypePrefectureOfPlans < ActiveRecord::Migration[6.1]
  def change
    change_column :plans, :prefecture, :integer, default: 0, null: false
  end
end
