class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets
    redirect_to(root_path, :notice => 'User not found') unless @user
  end
end
