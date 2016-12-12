require 'rails_helper'

RSpec.describe User, type: :model do
  it "should not create new user with empty name" do
    User.create(name: '')

    expect(User.count).to eq(0)
  end

  it "should not create new user with empty email" do
    User.create(name: 'ken', password: '123', email: '')

    expect(User.count).to eq(0)
  end

  it "should not create new user with empty password" do
    User.create(name: 'ken', email: 'test', password: '')

    expect(User.count).to eq(0)
  end
end
