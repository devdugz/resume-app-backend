class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  include ActionController::Cookies

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id]) if cookies.signed[:user_id]
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end
