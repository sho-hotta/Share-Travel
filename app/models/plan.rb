class Plan < ApplicationRecord
  enum region: { 北海道・東北: 0, 北関東: 1, 首都圏: 2, 甲信越: 3, 東海: 4, 北陸: 5, 近畿: 6, 山陽・山陰: 7, 四国: 8, 九州・沖縄: 9 }
  enum prefecture: { 北海道: 0, 青森: 1, 岩手: 2, 宮城: 3, 秋田: 4, 山形: 5, 福島: 6, 茨城: 7, 栃木: 8, 群馬: 9, 埼玉: 10, 千葉: 11, 東京: 12,
                     神奈川: 13, 新潟: 14, 長野: 15, 山梨: 16, 静岡: 17, 愛知: 18, 岐阜: 19, 三重: 20, 富山: 21, 石川: 22, 福井: 23, 滋賀: 24, 京都: 25, 大阪: 26, 兵庫: 27, 奈良: 28, 和歌山: 29, 鳥取: 30, 島根: 31, 岡山: 32, 広島: 33, 山口: 34, 徳島: 35, 香川: 36, 愛媛: 37, 高知: 38, 福岡: 39, 佐賀: 40, 長崎: 41, 熊本: 42, 大分: 43, 宮崎: 44, 鹿児島: 45, 沖縄: 46 }

  has_many :destinations, dependent: :destroy
  accepts_nested_attributes_for :destinations, allow_destroy: true
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :region, presence: true
  validates :prefecture, presence: true

  scope :select_index, -> { select(:id, :title, :prefecture, :updated_at) }

  def save_tag(add_tags)
    current_tags = self.tags.pluck(:word) unless self.tags.nil?
    old_tags = current_tags - add_tags
    new_tags = add_tags - current_tags

    old_tags.each do |old_tag|
      self.tags.delete Tag.find_by(word: old_tag)
    end

    new_tags.each do |new_tag|
      post_tag = Tag.find_or_create_by(word: new_tag)
      self.tags << post_tag
    end
  end
end
