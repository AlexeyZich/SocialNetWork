class NewsController < ApplicationController
  before_action :check_user!

  def index
    @posts = Post.where(author: current_user.friends)
    @posts_on_my_wall = Post.where(author: current_user.friends, postable: current_user)
    @posts = @posts - @posts_on_my_wall
  end
end
