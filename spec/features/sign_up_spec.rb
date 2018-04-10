require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do
  scenario 'Valid fill in form creates a new user' do
    visit root_path

    click_link 'Sign up'

    fill_in 'First Name', with: 'Filip'
    fill_in 'Last Name', with: 'Rieger'
    fill_in 'Email', with: 'test_email@example.com'
    fill_in 'Password', with: '123456789', match: :prefer_exact
    fill_in 'Password confirmation', with: '123456789', match: :prefer_exact

    fill_in 'family[name]', with: 'Riegers'

    click_button 'Sign up'

    expect(page)
      .to have_text 'A message with a confirmation link has been sent to your email address.'
    expect(page)
      .to have_text 'Please follow the link to activate your account.'
    expect(page)
      .to have_text 'Log in'
    expect(ActionMailer::Base.deliveries.count).to eq 1
  end

  scenario 'User sign up fails as required fields are missing' do
    visit root_path

    click_link 'Sign up'

    click_button 'Sign up'

    expect(page).to have_text 'errors prohibited this user from being saved'
    expect(page).to have_text "can't be blank"
  end
end
