class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_select_values, only: [:new, :create, :edit, :update]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @latest_stories = Story.published.order(published_at: :desc).limit(5)
    @categories = Category.all
    @genres = Genre.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.new(story_params)

    if params[:commit].include?("下書き")
      @story.status = "draft"
    else
      @story.status = "published"
      @story.published_at = Time.current
    end

    if @story.save
      if @story.draft?
        redirect_to drafts_stories_path
      else
        redirect_to root_path
      end
    else
      set_select_values
      render :new, status: :unprocessable_entity
    end
  end

  def drafts
    @drafts = current_user.stories.draft.order(created_at: :desc)
  end

  def show
  @comments = @story.comments.includes(:user)
  end

  def edit
  end

  def update
    if params[:commit].include?("下書き")
      @story.status = "draft"
    else
      @story.status = "published"
      @story.published_at ||= Time.current
    end

    if @story.update(story_params)
      if @story.draft?
        redirect_to drafts_stories_path
      else
        redirect_to story_path(@story)
      end
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
    params.require(:story).permit(:category_id, :genre_id, :title, :body)
  end

  def set_select_values
    @categories = Category.all
    @genres = Genre.all
  end

  def set_story
    @story = Story.find(params[:id])
  end
end