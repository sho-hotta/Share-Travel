class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_plans, through: :likes, source: :plan
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_plans, through: :bookmarks, source: :plan

  validates :name, presence: true, length: { maximum: 20 }

  def like?(plan)
    self.like_plans.include?(plan)
  end

  def bookmark?(plan)
    self.bookmark_plans.include?(plan)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
