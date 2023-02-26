class RegistrationService < ApplicationService
  class PasswordDoesNotMatch < StandardApiError; end

  def initialize(user_params)
    @email = user_params[:email]
    @password = user_params[:password]
    @password_confirmation = user_params[:password_confirmation]
  end

  def call
    password_match?

    user = User.create!(email: email, password: password)

    JwtServices::GenerateToken.call(user.id)
  end

  private

  attr_accessor :user, :email, :password, :password_confirmation

  def password_match?
    return if password == password_confirmation

    raise PasswordDoesNotMatch, "Password and password confirmation doesn't match"
  end
end