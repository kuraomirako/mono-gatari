class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @stories = Story.where(genre_id: @genre.id).order(created_at: :desc)
  end
end
