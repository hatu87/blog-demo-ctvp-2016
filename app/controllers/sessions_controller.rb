class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user.present?
      session[:user_id] = user.id
      redirect_to articles_path
    else
      flash[:error] = 'Invalid Email or Password'
      render 'new'
    end
  end
end
