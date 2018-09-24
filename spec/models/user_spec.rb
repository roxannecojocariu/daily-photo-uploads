require 'rails_helper'

RSpec.describe User, type: :model do
  new_user = FactoryBot.create(:user)

  it "instantiates a User object" do
  	expect(new_user).to be_instance_of User
  end
end
