FactoryBot.define do
  factory :goal do
    title { Faker::StrangerThings.quote }
    public { [true, false].sample }
    completed { [true, false].sample }
    user_id { User.create(username: 'mavers', password: 'doggies').id }
  end
end
