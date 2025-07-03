class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @genres = Genre.all
    @stories = Story.where(category_id: @category.id).order(created_at: :desc)
  end
end
