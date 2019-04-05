class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # make sure the user is logged in before action like edit
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 确保是管理员
  def admin_user
    redirect_to(root_url) unless admin?
  end
end
