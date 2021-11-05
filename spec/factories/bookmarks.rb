FactoryBot.define do
  factory :bookmark do
    plan
    user { plan.user }
  end
end
