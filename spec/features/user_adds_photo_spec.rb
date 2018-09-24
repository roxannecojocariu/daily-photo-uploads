require 'rails_helper'

feature 'User adds a picture', %Q{
  As a signed in user
  I want to post a picture
  So that I can have my daily photo uploaded
} do
  before :each do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'supply image and description and post to site' do
    visit new_photo_path

    user_image = FactoryBot.create(:photo)
    attach_file('photo_image', user_image.image, visible: true)

    click_button("Submit Today's Photo")

    expect(page).to have_css("img[src*='user_image.jpg']")
  end
end
