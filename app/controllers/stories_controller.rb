class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_select_values, only: [:new, :create]

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


  private
  def story_params
    params.require(:story).permit(:category_id, :genre_id, :title, :body).merge(user_id: current_user.id)
  end

  def set_select_values
    @categories = Category.all
    @genres = Genre.all
  end

end