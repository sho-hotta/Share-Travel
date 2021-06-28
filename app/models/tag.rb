class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :plans, through: :tag_relationships

  validates :word, presence: true, uniqueness: true, length: { maximum: 10 }
end
