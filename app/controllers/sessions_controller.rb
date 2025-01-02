class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      cookie = { value: user.id }
      cookies.signed[:user_id] = cookie.merge(cookie_settings)
      render json: { email: user.email, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    cookies.delete(:user_id, cookie_settings)
    render json: { message: "Logged out successfully" }
  end

  private

  def cookie_settings
    if Rails.env.test?
      { httponly: true }
    else
      { httponly: true, secure: true, same_site: "None" }
    end
  end
end
