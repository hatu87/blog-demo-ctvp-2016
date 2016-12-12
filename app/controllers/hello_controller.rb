class HelloController < ApplicationController
  before_action :require_logged_in
  
  def index
    @name = 'default'
  end

  def say_hello
    @name = params[:name]
    render 'index'
  end
end
