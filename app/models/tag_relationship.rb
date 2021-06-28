class TagRelationship < ApplicationRecord
  belongs_to :plan
  belongs_to :tag

  validates :plan_id, presence: true
  validates :tag_id, presence: true
  validates :plan_id, uniqueness: { scope: :tag_id }
end
