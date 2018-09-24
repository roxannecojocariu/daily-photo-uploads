require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password {'password'}
    password_confirmation {'password'}
  end

 factory :photo do
   image {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/user_image.jpg')))}
   user {FactoryBot.create(:user)}
   date {'date'}
   description {'description'}
 end
end
