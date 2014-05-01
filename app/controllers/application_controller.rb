class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: "You are not authorized to view this page."
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, notice: "That record does not exist or has been deleted."
  end


  helper_method :current_user

  private
  def current_user
    begin
      @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:current_user_id)
      nil
    end
  end

end
