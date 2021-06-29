class Like < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  validates :user_id, presence: true
  validates :plan_id, presence: true
  validates :user_id, uniqueness: { scope: :plan_id }
end
