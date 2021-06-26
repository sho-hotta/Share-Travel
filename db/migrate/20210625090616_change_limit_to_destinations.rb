class ChangeLimitToDestinations < ActiveRecord::Migration[6.1]
  def change
    change_column :destinations, :name, :string, null: false, limit: 30
  end
end
