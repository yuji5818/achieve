class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user = User.find(params[:id])
    @follow = user.followed_users
    @follower = user.followers
  end
end
