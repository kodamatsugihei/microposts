class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  
  # フォローしているユーザー
  def followings
    # 自分のユーザーIDを取得している
    @user = User.find(params[:id])
    # 自分のユーザーで紐付いているフォローしている人を検索
    @following_users = @user.following_users
  end
  
  # フォローされているユーザー
  def followers
    @user = User.find(params[:id])
    # 自分のユーザーで紐付いているフォロワーを検索
    @follower_users = @user.follower_users
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    check_user(@user)
  end
  
  def update
    @user = User.find(params[:id])
    check_user(@user)
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :age, :region)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user(user)
    if (@user != current_user)
      redirect_to :root
    end
  end
end
