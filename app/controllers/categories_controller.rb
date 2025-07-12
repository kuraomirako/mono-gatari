class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @genres = Genre.all
    @stories = Story.published.where(category_id: @category.id).order(published_at: :desc)
  end
end
