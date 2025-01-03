class EducationsController < ApplicationController
  before_action :authenticate_user, except: [:create, :index, :show]

  def index
    @education = Education.all
    render json: @educations
  end

  def show
    @education = Education.find(params[:id])
    render json: @education
  end

  def create
    @education = Education.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details],
      user_id: current_user.id,
    )
    if @education.save
      render json: @education, status: :created
    else
      render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @education = Education.find(params[:id])
    if @education.user_id == current_user.id
      if @education.update(
        start_date: params[:start_date] || @education.start_date,
        end_date: params[:end_date] || @education.end_date,
        job_title: params[:job_title] || @education.job_title,
        company_name: params[:company_name] || @education.company_name,
        details: params[:details] || @education.details,
      )
        render json: @education
      else
        render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def destroy
    @education = Education.find(params[:id])
    if @education.user_id == current_user.id
      @education.destroy
      render json: { message: "Experience deleted successfully" }
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
