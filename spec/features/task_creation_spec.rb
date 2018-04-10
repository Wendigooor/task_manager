require 'rails_helper'

RSpec.feature 'Task Creation', type: :feature do
  given(:family) { create(:family, name: 'Hannemans') }
  given(:password) { '123456789' }
  given(:admin) do
    u = create(:user, email: 'hanneman@example.com', password: password)
    u.confirm
    u.add_role(:admin, family)
    u
  end
  given(:user) do
    u = create(:user, email: 'ahanneman@example.com', password: password)
    u.confirm
    u.add_role(:user, family)
    u
  end

  scenario 'Admin can create a task inside his family' do
    visit root_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: password

    click_button 'Log in'
    click_link family.name
    click_link 'New Task'

    expect(page).to have_text 'New Task'

    fill_in 'Description:', with: 'Clean room'

    click_button 'Create Task'

    expect(page).to have_text 'Clean room'
    expect(page).to have_text 'State: Opened'
  end

  scenario 'Admin cannot create a task without description' do
    visit root_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: password

    click_button 'Log in'
    click_link family.name
    click_link 'New Task'

    expect(page).to have_text 'New Task'

    click_button 'Create Task'

    expect(page).to have_text "Description:can't be blank"
  end

  scenario 'User cannot create a task inside his family' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: password

    click_button 'Log in'
    click_link family.name
    click_link 'New Task'

    expect(page).to have_text 'You are not authorized to access this page.'
  end
end

