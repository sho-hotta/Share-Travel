class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @bookmark_plan = current_user.bookmarks.build(plan_id: params[:plan_id])
    @bookmark_plan.save
  end

  def destroy
    @unbookmark_plan = Bookmark.find_by(plan_id: params[:plan_id], user_id: current_user.id)
    @unbookmark_plan.destroy
  end
end
