FactoryBot.define do 
  factory :comment do 
    content { Faker::Lorem.sentence }
    user
    movie 
    # created_at { DateTime.now }
    # updated_at { DateTime.now }
    
    trait :older_comment do
      created_at { Faker::Time.between(2.weeks.ago, 1.week.ago) }
    end
  end
end