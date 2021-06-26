class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :name, null: false
      t.text :description, limit: 300
      t.string :image
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
