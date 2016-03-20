class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to :controller => :articles, :action => :index
    else
    # If user's login doesn't work, send them back to the login form.
      # redirect_to action: "new"
    end
  end

  def destroy
    session[:user_id] = nil
    # redirect_to :controller => :articles, :action => :index
    redirect_to root_path
  end
end
