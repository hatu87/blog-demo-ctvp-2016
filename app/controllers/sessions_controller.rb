class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate(params[:email], params[:password])
      redirect_to articles_path
    else
      flash[:error] = 'Invalid Email or Password'
      render 'new'
    end
  end
end
