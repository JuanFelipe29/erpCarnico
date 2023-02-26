# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  attr_reader :current_user

  def authorized_user!
    return if logged_in?

    render json: { message: "You need to log in to see this content" }, status: :unauthorized
  end

  def logged_in?
    return unless auth_header

    user_id = JwtServices::DecodeToken.call(auth_header.split[1])
    @current_user = User.find(user_id)
  end

  def auth_header
    request.headers["Authorization"]
  end
end
