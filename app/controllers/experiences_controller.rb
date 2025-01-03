class ExperiencesController < ApplicationController
  before_action :authenticate_user, except: [:create, :index, :show]

  def index
    @experiences = Experience.all
    render json: @experiences
  end

  def show
    @experience = Experience.find(params[:id])
    render json: @experience
  end

  def create
    @experience = Experience.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details],
      user_id: current_user.id,
    )
    if @experience.save
      render json: @experience, status: :created
    else
      render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.user_id == current_user.id
      if @experience.update(
        start_date: params[:start_date],
        end_date: params[:end_date],
        job_title: params[:job_title],
        company_name: params[:company_name],
        details: params[:details],
      )
        render json: @experience
      else
        render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    if @experience.user_id == current_user.id
      @experience.destroy
      render json: { message: "Experience deleted successfully" }
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
