FactoryBot.define do
  factory :user do
    username { Faker::StrangerThings.name }
    password { 'password' }
  end
end
