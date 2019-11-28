class LearningOpportunitiesController < ApplicationController
  before_action :set_params, only: %i[create update]
  before_action :set_learningopportunity, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @learningopportunities = LearningOpportunity.all
  end

  def show
  end

  def new
    @learningopportunity = LearningOpportunity.new
  end

  def create
    @learningopportunity = LearningOpportunity.new(set_params)
    if @learningopportunity.save
      redirect_to learning_opportunity_path(@learningopportunity)
    else
      render :new
    end
  end

  def edit; end

  def update
    @learningopportunity.update(set_params)
    if @learningopportunity.save
      redirect_to learningopportunity_path(@learningopportunity)
    else
      render :edit
    end
  end

  def destroy
    @learningopportunity.destroy
    redirect_to root_path
  end

  private

  def set_params
    params.require(:learning_opportunity).permit!
  end

  def set_learningopportunity
    @learningopportunity = LearningOpportunity.find(params[:id])
  end

end
