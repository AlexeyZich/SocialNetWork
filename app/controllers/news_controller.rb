class NewsController < ApplicationController
  before_action :check_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    
  end
end
