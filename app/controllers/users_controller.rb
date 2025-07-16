class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :follow]
  before_action :correct_user, only: [:edit, :update]
  before_action :correct_user_for_follow, only: [:follow]

  def show
    @user = User.find(params[:id])
    @stories = @user.stories.published.order(published_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def bookmarks
    @user = User.find(params[:id])
    @bookmarked_stories = @user.bookmarked_stories
  end

  def follow
    @followers = @user.followers.where(is_deleted: false)
    @following = @user.following.where(is_deleted: false)
  end

  def withdraw  # 退会処理
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :profile, :icon)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user == @user
  end

  def correct_user_for_follow
    Rails.logger.debug "current_user.id: #{current_user.id} (#{current_user.id.class})"
    Rails.logger.debug "@user.id: #{@user.id} (#{@user.id.class})"
  
    unless current_user.id.to_s == @user.id.to_s
      redirect_to root_path
    end
  end
end
