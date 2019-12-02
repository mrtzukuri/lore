class LearningOpportunitiesController < ApplicationController
  before_action :set_params, only: %i[create update]
  before_action :set_learningopportunity, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    wl = WhatLanguage.new
    if params[:query].present?
      @learningopportunities = LearningOpportunity.joins(:skills).where('skills.name = (?)', params[:query])
    else
      @learningopportunities = LearningOpportunity.all
    end
    @learningopportunities = filter(@learningopportunities)
    @learningopportunities = @learningopportunities.reject { |lo| wl.language(lo.name) == :arabic || wl.language(lo.name) == :portuguese }
    respond_to do |format|
      format.html { learning_opportunities_path }
      format.js
    end
  end

  def show
    @LearningOpportunity = LearningOpportunity.geocoded

    @markers = {
      lat: @learningopportunity.latitude,
      lng: @learningopportunity.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { learningopportunity: @learningopportunity })
    }
  end

  def new
    @learningopportunity = LearningOpportunity.new
  end

  def create
    @learningopportunity = LearningOpportunity.new(set_params)
    @learningopportunity.user_id = current_user.id
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

  def filter(lo_collection)
    lo_collection = lo_collection.where("price <= (?)", params["max-price"]) if params_exists?(params["max-price"])
    lo_collection = lo_collection.near(params["location"], 50) if params_exists?(params["location"])
    lo_collection = lo_collection.where("start_date >= (?) AND end_date <= (?)", Date.parse(params["start-date"]), Date.parse(params["end-date"])) if params_exists?(params["start-date"]) && params_exists?(params["end-date"])
    lo_collection = lo_collection.where("course_type IN (?)", params["type"]) if !params['type'].nil?
    lo_collection
  end

  def params_exists?(parameter)
    parameter != "" && !parameter.nil?
  end

  def set_params
    params.require(:learning_opportunity).permit!
  end

  def set_learningopportunity
    @learningopportunity = LearningOpportunity.find(params[:id])
  end
end
