class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		flash[:succes] = "Welcome to the Sample App"
  		redirect_to @user
  	else
  		render 'new'
    end
  end
end
