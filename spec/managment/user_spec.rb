require 'rails_helper'

RSpec.describe 'watch my events', type: :feature do
  scenario 'with valid user' do
    visit new_user_registration_path
    fill_in 'Email', with: 'newusertest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    visit users_path
    expect(page).to have_content('Upcoming Events')
  end

  scenario 'with unvalid user' do
    visit new_user_registration_path
    fill_in 'Email', with: 'newusertest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    visit users_path
    expect(page).to have_content('You have to login first')
  end

  scenario 'without sign up' do
    visit users_path
    expect(page).to have_content('You have to login first')
  end
end
