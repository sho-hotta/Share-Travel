class PlansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index; end

  def show
    @plan = Plan.find(params[:id])
    @destinations = @plan.destinations
  end

  def new
    @plan = Plan.new
    @plan.destinations.build
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      flash[:success] = 'プランを投稿しました！'
      redirect_to @plan
    else
      render 'new'
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      flash[:success] = 'プランを編集しました！'
      redirect_to @plan
    else
      render 'edit'
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:success] = 'プランを削除しました！'
    redirect_to root_url
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :region, :prefecture, destinations_attributes: %i[name description _destroy id])
  end

  def correct_user
    @user = Plan.find(params[:id]).user
    redirect_to(root_url) unless current_user?(@user)
  end
end
