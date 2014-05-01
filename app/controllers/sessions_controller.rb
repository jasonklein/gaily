class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      if user.role? :admin
        redirect_to(root_url)
      else
        redirect_to user
      end
    else
      flash.now.alert = "Invalid username or password."
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to(root_url)
  end
end