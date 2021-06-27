class Tag < ApplicationRecord
  validates :word, presence: true, uniqueness: true, length: { maximum: 10 }
end
