class TagRelationship < ApplicationRecord
  validates :plan_id, presence: true
  validates :tag_id, presence: true
end
