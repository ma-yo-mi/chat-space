FactoryGirl.define do

   factory :user do
    name       { Faker::GameOfThrones.character }
    email      { Faker::Internet.free_email }
    password   { Faker::Internet.password(8) }
   end
end
