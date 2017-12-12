require 'rails_helper'

RSpec.feature "Visitor can login", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name: 'C',
      last_name: 'H',
      email: 'test@example.com',
      password: 'test4321',
      password_confirmation: 'test4321'
      )
  end

  scenario "A user logs in" do
    # ACT
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'test@example.com'
      fill_in id: 'password', with: 'test4321'

      click_on 'Submit'

      save_screenshot
    end

    # DEBUG / VERIFY

    expect(page).to have_content 'Products'


  end
end