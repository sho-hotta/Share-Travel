class Destination < ApplicationRecord
  belongs_to :plan

  validates :plan_id, presence: true
  validates :name, presence: true
  validates :description, length: { maximum: 300 }
end
