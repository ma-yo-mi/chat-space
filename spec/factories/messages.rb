FactoryGirl.define do
  factory :message do
    body   "helloworld"
    image  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))
    user
    group
  end
end
