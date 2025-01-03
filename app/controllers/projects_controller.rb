class ProjectsController < ApplicationController
  before_action :authenticate_user, except: [:create, :index, :show]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    @project = Project.new(
      name: params[:name],
      description: params[:description],
      url: params[:url],
      screenshot: params[:screenshot],
      user_id: current_user.id,
    )
    if @project.save
      render json: @project, status: :created
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.user_id == current_user.id
      if @project.update(
        name: params[:name] || @project.name,
        description: params[:description] || @project.description,
        url: params[:url] || @project.url,
        screenshot: params[:screenshot] || @project.screenshot,
      )
        render json: @project
      else
        render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.user_id == current_user.id
      @project.destroy
      render json: { message: "Project successfully deleted" }
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
