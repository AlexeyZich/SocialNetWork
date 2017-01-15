class UsersController < ApplicationController
  before_action :check_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    @user = User.find(params[:id]) 
  end

  def edit
    redirect_to edit_user_path(current_user) if params[:id] != current_user.id.to_s
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Изменения сохранены."
      render :edit
    else
      render :edit
    end
  end

  def not_found
    render 'not_found'
  end

  protected

  def check_user!
    redirect_to root_path unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :age, :male, :city, :country, :description)
  end
end
