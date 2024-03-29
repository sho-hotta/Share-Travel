class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @like_plan = current_user.likes.build(plan_id: params[:plan_id])
    @like_plan.save
    redirect_back fallback_location: root_url
  end

  def destroy
    @unlike_plan = Like.find_by(plan_id: params[:plan_id], user_id: current_user.id)
    @unlike_plan.destroy
    redirect_back fallback_location: root_url
  end
end
