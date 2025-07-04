class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @stories = @user.stories.order(created_at: :desc)
    @latest_stories = Story.order(created_at: :desc).limit(5)
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
end
