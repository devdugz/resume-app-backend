class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :index, :show]

  def index
    @users = User.all
    render json: @users.as_json(
      include: {
        experiences: {},
        educations: {},
        skills: {},
        projects: {},
      },
    )
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

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      if @user.update(
        first_name: params[:first_name] || @user.first_name,
        last_name: params[:last_name] || @user.last_name,
        email: params[:email] || @user.email,
        password: params[:password] || @user.password,
        phone_number: params[:phone_number] || @user.phone_number,
        short_bio: params[:short_bio] || @user.short_bio,
        linkedin_url: params[:linkedin_url] || @user.linkedin_url,
        twitter_handle: params[:twitter_handle] || @user.twitter_handle,
        website_url: params[:website_url] || @user.website_url,
        online_resume_url: params[:online_resume_url] || @user.online_resume_url,
        github_url: params[:github_url] || @user.github_url,
        photo: params[:photo] || @user.photo,
      )
        render json: @user.as_json(
          include: {
            experiences: {},
            educations: {},
            skills: {},
            projects: {},
          },
        )
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      render json: { message: "User successfully deleted" }
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
