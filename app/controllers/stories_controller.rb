class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_select_values, only: [:new, :create, :edit, :update]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comments = @story.comments.includes(:user)
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to story_path(@story)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy
    redirect_to root_path
  end

  private
  def story_params
    params.require(:story).permit(:category_id, :genre_id, :title, :body).merge(user_id: current_user.id)
  end

  def set_select_values
    @categories = Category.all
    @genres = Genre.all
  end

  def set_story
    @story = Story.find(params[:id])
  end
end