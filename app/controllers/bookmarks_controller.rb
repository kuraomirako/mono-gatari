class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark = current_user.bookmarks.new(story_id: params[:story_id])
    if @bookmark.save
      redirect_back fallback_location: root_path, notice: "積読しました"
    else
      redirect_back fallback_location: root_path, alert: "積読に失敗しました"
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_back fallback_location: root_path, notice: "積読解除しました"
  end

end
