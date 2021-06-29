class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_plans, through: :likes, source: :plan

  validates :name, presence: true, length: { maximum: 20 }

  def like?(plan)
    self.like_plans.include?(plan)
  end
end
