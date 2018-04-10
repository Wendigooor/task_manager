require 'rails_helper'

RSpec.feature 'Family Members Actions', type: :feature, js: true do
  given(:family) { create(:family, name: 'Hannemans') }
  given(:password) { '123456789' }
  given!(:admin) do
    u = create(:user, password: password)
    u.confirm
    u.add_role(:admin, family)
    u
  end
  given!(:user) do
    u = create(:user, password: password)
    u.confirm
    u.add_role(:user, family)
    u
  end

  scenario 'User can remove yourself from family' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: password

    click_button 'Log in'
    click_link family.name

    expect(page).to have_text user.email
    expect(page).to have_text admin.email

    find("[data-remove-id='#{user.id}']").click()
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_text 'You are not authorized to access this page.'
    expect(page).to_not have_text family.name
  end

  scenario 'User can remove another user from family' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: password

    click_button 'Log in'
    click_link family.name

    expect(page).to have_text user.email
    expect(page).to have_text admin.email

    find("[data-remove-id='#{admin.id}']").click()
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_text user.email
    expect(page).to_not have_text admin.email
  end

  scenario 'User can add new user to family' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: password

    click_button 'Log in'
    click_link family.name

    click_link 'New Family Member'

    fill_in 'user_email', with: '12345@example.com'

    click_button 'Create User'

    expect(page).to have_text '12345@example.com'
  end
end

