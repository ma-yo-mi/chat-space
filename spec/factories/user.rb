FactoryGirl.define do

   factory :user do
    name       { Faker::GameOfThrones.character }
    email      { Faker::Internet.free_email }
    password   12345678
   end
end
