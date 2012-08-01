class SessionsController < ApplicationController
  skip_before_filter :authorize

=begin
  def new
  end
=end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, :alert => 'Invalid user/password conbination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged out"
  end
end
