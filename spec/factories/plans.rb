FactoryBot.define do
  factory :plan do
    title { 'TestTitle' }
    region { '首都圏' }
    prefecture { '東京' }
    user
  end
end
