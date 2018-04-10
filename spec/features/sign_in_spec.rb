require 'rails_helper'

RSpec.feature 'User Sign In', type: :feature do
  given(:family) { create(:family, name: 'Hannemans') }
  given(:password) { '123456789' }
  given(:admin) do
    u = create(:user, email: 'hanneman@example.com', password: password)
    u.confirm
    u.add_role(:admin, family)
    u
  end
  given(:user) do
    u = create(:user, email: 'rogers@example.com', password: password)
    u.confirm
    u
  end

  scenario 'After valid fill in can see only his family on dashboard page and open it' do
    visit root_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: password

    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_text 'Dashboard'
    expect(page).to have_text family.name

    click_link family.name

    expect(page).to have_text "Family #{family.name}"
    expect(page).to have_text 'Members'
    expect(page).to have_text 'hanneman@example.com'
  end

  scenario 'Without family after valid fill in cannot see strangers families on dashboard page' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: password

    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_text 'Dashboard'
    expect(page).to_not have_text family.name
  end

  scenario 'User sign in fails as required fields are missing' do
    visit root_path

    click_button 'Log in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_text 'Log in Email Password Remember me Sign up Forgot your password?'
    expect(page).to_not have_text 'Dashboard'
  end
end

