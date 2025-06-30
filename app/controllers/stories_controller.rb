class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_select_values, only: [:new, :create]
  before_action :set_story, only: [:show, :edit, :update]

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
      Rails.logger.debug @story.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
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