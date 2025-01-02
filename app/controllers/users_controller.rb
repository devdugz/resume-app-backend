class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user.as_json(
      include: {
        experiences: {},
        educations: {},
        skills: {},
        projects: {},
      },
    )
  end

  def current
    @user = current_user
    if @user
      render json: @user.as_json(
        include: {
          experiences: {},
          educations: {},
          skills: {},
          projects: {},
        },
      )
    else
      render json: { error: "Not logged in" }, status: :unauthorized
    end
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_number: params[:phone_number],
      short_bio: params[:short_bio],
      linkedin_url: params[:linkedin_url],
      twitter_handle: params[:twitter_handle],
      website_url: params[:website_url],
      online_resume_url: params[:online_resume_url],
      github_url: params[:github_url],
      photo: params[:photo],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
