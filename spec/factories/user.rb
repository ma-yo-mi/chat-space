FactoryGirl.define do
  pass = Faker::Internet.password(8)

   factory :user do
    name(Faker::GameOfThrones.character)
    email(Faker::Internet.free_email)
    password(pass)
    password_confirmation(pass)
   end
end



