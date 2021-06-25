class ChangeDatatypeRegionOfPlans < ActiveRecord::Migration[6.1]
  def change
    change_column :plans, :region, :integer, default: 0, null: false
  end
end
