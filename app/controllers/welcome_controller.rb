class WelcomeController < ApplicationController
  before_action :check_user!

  layout 'landing'

  def index
    redirect_to new_user_session_path 
  end

  protected

  def check_user!
    redirect_to user_path(current_user) if user_signed_in?
  end
end
