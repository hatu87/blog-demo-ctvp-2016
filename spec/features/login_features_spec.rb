require 'rails_helper'

RSpec.feature "LoginFeatures", type: :feature do
  scenario "visit /login will render login page" do
    visit '/login'

    expect(page).to have_text('Email')
    expect(page).to have_text('Password')
    # expect(page).to have_tag('button#login', with: { name: 'login', type: 'submit' })
  end

  scenario "visit /login and enter valid email, password will redirect to /articles" do
    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(8), name: Faker::Name.name)

    visit '/login'

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_button "Login"

    expect(current_path).to eq('/articles')
  end

  scenario "visit /login and enter invalid email, password will render error" do
    visit '/login'
    fill_in 'email', with: 'ken@mail.vn'
    fill_in 'password', with: '1234468'

    click_button "Login"

    expect(current_path).to eq('/login')
    expect(page).to have_text("Invalid Email or Password")

  end
end
