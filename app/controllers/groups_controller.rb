class GroupsController < ApplicationController
  before_action :check_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @authored_groups = current_user.authored_groups
    # @new_groups = Group.includes(:users).where('(groups.user_id != ?) AND (SELECT users.id != ?)', current_user.id, current_user.id).references(:users)
    @new_groups = Group.without_user(current_user).where.not(groups: { author: current_user })
    # gr = Group.joins("join groups_users on users.id = groups_users.user_id").where(["groups_users.user_id != ?", current_user.id])
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author = current_user
    if @group.save
      @group.users << current_user if !@group.users.include? current_user
      flash[:success] = 'Группа создана'
      redirect_to @group
    else
      flash[:error] = 'Ошибка'
      redirect_to groups_path
    end
  end

  def edit
    @group = Group.find(params[:id])
    redirect_to group_path(@group) if @group.author != current_user
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.author == current_user
      if @group.destroy
        flash[:success] = "Группа удалена"
        redirect_to groups_path
      else
        flash[:error] = "Ошибка"
        redirect_to edit_group_path(@group)
      end
    else
      flash[:error] = "Нет прав"
      redirect_to edit_group_path(@group)
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.author == current_user
      @group.assign_attributes(group_params)
      if @group.save
        flash[:success] = "Изменения сохранены."
        render :show
      else
        render :show
      end
    else
      flash[:error] = 'Вы не можете быть редактором'
      redirect_to group_path(@group)
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def subscribe
    @group = Group.find(params[:id])
    @group.users << current_user if !@group.users.include? current_user
    flash[:success] = "Вы подписаны на #{@group.title}"
    redirect_to @group
  end

  def unsubscribe
    @group = Group.find(params[:id])
    if @group.users.include? current_user
      if @group.users.delete(current_user)
        flash[:success] = "Вы отписались"
        redirect_to groups_path
      else
        flash[:error] = "Ошибка"
        redirect_to edit_group_path(@group)
      end
    else
      flash[:error] = "Ошибка"
      redirect_to edit_group_path(@group)
    end
  end

  def create_post
    @group = Group.find(params[:id])
    @post = @group.posts.new
    @post.assign_attributes(post_params)
    @post.author = current_user
    if @post.save
      flash[:success] = 'Запись создана'
      redirect_to @group
    else
      flash[:error] = 'Ошибка'
      redirect_to @group
    end
  end

  def not_found
    render 'shared/not_found'
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
