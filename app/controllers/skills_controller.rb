class SkillsController < ApplicationController
  before_action :authenticate_user, except: [:create, :index, :show]

  def index
    @skills = Skill.all
    render json: @skills
  end

  def create
    @skill = Skill.new(
      skill_name: params[:skill_name],
      user_id: current_user.id,
    )
    if @skill.save
      render json: @skill
    else
      render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @skill = Skill.find(params[:id])
    render json: @skill
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.user_id == current_user.id
      if @skill.update(skill_name: params[:skill_name] || @skill.skill_name)
        render json: @skill
      else
        render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    if @skill.user_id == current_user.id
      @skill.destroy
      render json: { message: "Skill successfully deleted" }
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
