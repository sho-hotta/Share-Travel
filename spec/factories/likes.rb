FactoryBot.define do
  factory :like do
    plan
    user { plan.user }
  end
end
