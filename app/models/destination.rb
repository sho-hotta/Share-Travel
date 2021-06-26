class Destination < ApplicationRecord
  belongs_to :plan

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }
end
