class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.integer :plan_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :tag_relationships, :plan_id
    add_index :tag_relationships, :tag_id
    add_index :tag_relationships, %i[plan_id tag_id], unique: true
  end
end
