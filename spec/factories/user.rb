FactoryBot.define do 
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email }
    password { "password" }
    confirmed_at { DateTime.now }
  end
end
