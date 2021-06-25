FactoryBot.define do
  factory :user do
    name { 'user1' }
    email { 'user1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
end
