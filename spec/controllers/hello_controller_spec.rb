require 'rails_helper'

RSpec.describe HelloController, type: :controller do
  it 'should not insert comment when user is not logged in' do
    get :index

    expect(response).to redirect_to(login_path)
  end
end
