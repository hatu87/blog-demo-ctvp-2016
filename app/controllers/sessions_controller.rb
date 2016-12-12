class SessionsController < ApplicationController
  def new
  end

  def create
    # user = User.find_by(email: params[:email], password: params[:password])

    if params[:email] == 'ken@mail.vn' and params[:password] == '12345678'
      redirect_to articles_path
    else
      render 'new'
    end
  end
end
