class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.following << user
    redirect_to user_path(user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.active_relationships.find_by(followed_id: user.id).destroy
    redirect_to user_path(user)
  end
end