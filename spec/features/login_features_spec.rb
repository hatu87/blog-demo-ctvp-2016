require 'rails_helper'

RSpec.feature "LoginFeatures", type: :feature do
  scenario "visit /login will render login page" do
    visit '/login'

    expect(page).to have_text('Email')
    expect(page).to have_text('Password')
    # expect(page).to have_tag('button#login', with: { name: 'login', type: 'submit' })
  end

  scenario "visit /login and enter valid email, password will redirect to /articles" do
    visit '/login'

    fill_in 'email', with: 'ken@mail.vn'
    fill_in 'password', with: '12345678'

    click_button "Login"

    expect(current_path).to eq('/articles')
  end
end
