class PlansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_plan, only: %i[show edit update destroy]

  def index
    @plans = Plan.select_index
  end

  def show
    @destinations = @plan.destinations
    @tags = @plan.tags
  end

  def new
    @plan = Plan.new
    @plan.destinations.build
  end

  def create
    @plan = current_user.plans.build(plan_params)
    tag_list = params[:plan][:word].split(nil)
    if @plan.save
      @plan.save_tag(tag_list)
      flash[:success] = 'プランを投稿しました！'
      redirect_to @plan
    else
      render 'new'
    end
  end

  def edit; end

  def update
    tag_list = params[:plan][:word].split(nil)
    if @plan.update(plan_params)
      @plan.save_tag(tag_list)
      flash[:success] = 'プランを編集しました！'
      redirect_to @plan
    else
      render 'edit'
    end
  end

  def destroy
    @plan.destroy
    flash[:success] = 'プランを削除しました！'
    redirect_to root_url
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :region, :prefecture, destinations_attributes: %i[name description _destroy id])
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def correct_user
    @user = Plan.find(params[:id]).user
    redirect_to(root_url) unless current_user?(@user)
  end
end
