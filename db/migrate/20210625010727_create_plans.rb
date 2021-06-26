class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title, null: false, limit: 30
      t.column :region, "ENUM('北海道・東北', '北関東', '首都圏', '甲信越', '東海',
                              '北陸', '近畿', '山陽・山陰', '四国', '九州・沖縄') DEFAULT '北海道・東北' NOT NULL"
      t.column :prefecture, "ENUM('北海道', '青森', '岩手', '宮城', '秋田', '山形', '福島',
                                  '栃木', '群馬', '茨城',
                                  '埼玉', '千葉', '東京', '神奈川',
                                  '山梨', '長野', '新潟',
                                  '静岡', '岐阜', '愛知', '三重',
                                  '富山', '石川', '福井',
                                  '滋賀', '京都', '大阪', '兵庫', '奈良', '和歌山',
                                  '鳥取', '島根', '岡山', '広島', '山口',
                                  '徳島', '香川', '愛媛', '高知',
                                  '福岡', '佐賀', '長崎', '熊本', '大分', '宮崎', '鹿児島', '沖縄') DEFAULT '北海道' NOT NULL"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plans, %i[user_id created_at]
    add_index :plans, %i[user_id updated_at]
  end
end
