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
    @user.assign_attributes(user_params)
    @user.male = nil if user_params[:male] == 'nil'
    if @user.save
      flash[:success] = "Изменения сохранены."
      render :edit
    else
      render :edit
    end
  end

  def create_post
    @user = User.find(params[:id])

    @post = @user.posts.new
    @post.assign_attributes(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Запись создана'
      redirect_to @user
    else
      flash[:error] = 'Ошибка'
      redirect_to @user
    end
  end

  def not_found
    render 'not_found'
  end

  def add_to_friend
    @user = User.find(params[:id]) 
    if !current_user.friends.include? @user
      if @user.friend_requests.create(sender: current_user)
        flash[:success] = "Дружба создана"
        redirect_to @user
      else
        flash[:error] = "Дружба не создана"
        redirect_to @user
      end
    else
      flash[:error] = "Уже в друзьях"
      redirect_to @user
    end
  end

  protected

  def check_user!
    redirect_to root_path unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :age, :male, :city, :country, :description)
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
