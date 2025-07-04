class ReactionsController < ApplicationController

  def create
    Reaction.where(user: current_user, story_id: params[:story_id]).destroy_all
    @reaction = Reaction.new(user: current_user, story_id: params[:story_id], kind: params[:kind])
    @reaction.save
    render json: { status: 'ok' }
  end

end