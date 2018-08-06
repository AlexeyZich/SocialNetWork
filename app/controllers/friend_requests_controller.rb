class FriendRequestsController < ApplicationController
  before_action :check_user!

  def index
    @friend_requests = current_user.friend_requests.where(approved: nil).limit(3)
    @friends = current_user.friends.page(params[:page]).per(20)
  end

  def approve
    fr = FriendRequest.find(params[:id])
    fr.approved = true
    if fr.save
      flash[:success] = 'Успех'
      redirect_to :friend_requests
    else
      flash[:success] = 'Ошибка'
      redirect_to :friend_requests
    end
  end

  def decline
    fr = FriendRequest.find(params[:id])
    fr.approved = false
    if fr.save
      flash[:success] = 'Успех'
      redirect_to :friend_requests
    else
      flash[:success] = 'Ошибка'
      redirect_to :friend_requests
    end
  end
end
