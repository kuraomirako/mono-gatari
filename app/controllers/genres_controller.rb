class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @categories = Category.all
    @stories = Story.published.where(genre_id: @genre.id).order(published_at: :desc)
  end
end