class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :word, null: false, limit: 10

      t.timestamps
    end
    add_index :tags, :word, unique: true
  end
end
