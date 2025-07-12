class ReactionsController < ApplicationController

  def create
    Reaction.where(user: current_user, story_id: params[:story_id]).destroy_all
    @reaction = Reaction.create(user: current_user, story_id: params[:story_id], kind: params[:kind])
    story = Story.find(params[:story_id])
    counts = story.reactions.group(:kind).count
    render json: { status: 'ok', counts: counts }
  end

end