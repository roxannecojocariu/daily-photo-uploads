require 'rails_helper'

RSpec.describe Photo, type: :model do
  submitted_photo = FactoryBot.create(:photo)

  it "instantiates a Photo object" do
  	expect(submitted_photo).to be_instance_of Photo
  end
end
