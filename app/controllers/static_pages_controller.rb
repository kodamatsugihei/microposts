class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @following_users = current_user.following_users
      @follower_users = current_user.follower_users
    end
  end
end
