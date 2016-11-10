class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find_by(username: params[:username])
    if current_user.following?(user)
      redirect_to user_path(user.username), notice: "You are already following #{user.username}"
    else
      Follow.create(followable: user, follower: current_user)
      redirect_to user_path(user.username), notice: "Successfully followed user"
    end
  end

  def destroy
    user = User.find_by(username: params[:username])
    Follow.find_by(followable: user, follower: current_user).destroy
    redirect_to user_path(user.username), notice: "Successfully unfollowed user"
  end
end
