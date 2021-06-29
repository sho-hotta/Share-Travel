class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
      t.index %i[user_id plan_id], unique: true
    end
  end
end
