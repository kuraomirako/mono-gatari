class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_select_values, only: [:new, :create, :edit, :update]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @latest_stories = Story.order(created_at: :desc).limit(5)
    @categories = Category.all
    @genres = Genre.all
    @stories = Story.where(status: 'published')
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.new(story_params)
    @story.status = params[:status] || 'published'
    if @story.save
      redirect_to @story, notice: @story.draft? ? "下書きを保存しました" : "投稿が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if @story.draft? && @story.user != current_user
      redirect_to root_path
    end
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
    params.require(:story).permit(:category_id, :genre_id, :title, :body, :status)
  end

  def set_select_values
    @categories = Category.all
    @genres = Genre.all
  end

  def set_story
    @story = Story.find(params[:id])
  end
end