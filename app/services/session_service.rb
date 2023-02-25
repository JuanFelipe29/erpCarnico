class SessionService < ApplicationService
  class AuthenticationError < StandardApiError; end

  def initialize(credentials)
    @credentials = credentials
  end

  def call
    raise AuthenticationError, "Invalid email or password" unless valid_credentials?

    JwtServices::GenerateToken.call(user.id)
  end

  private

  attr_reader :credentials

  def valid_credentials?
    user&.authenticate(credentials[:password])
  end

  def user
    @user ||= User.find_by(email: credentials[:email]&.downcase&.strip)
  end
end