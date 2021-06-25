class PlansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index; end

  def show; end

  def new
    @plan = Plan.new
    @destination = @plan.destinations.build
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      flash[:success] = 'プランを投稿しました！'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit; end

  private

  def plan_params
    params.require(:plan).permit(:title, :region, :prefecture)
  end
end
