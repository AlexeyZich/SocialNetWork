class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def check_user!
    redirect_to root_path unless user_signed_in?
  end

  private

  def layout_by_resource
    if devise_controller?
      "landing"
    else
      "application"
    end
  end

end
