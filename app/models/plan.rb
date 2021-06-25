class Plan < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :region, presence: true
  validates :prefecture, presence: true
end
