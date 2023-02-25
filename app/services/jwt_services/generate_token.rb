class JwtServices::GenerateToken < JwtServices::JwtBase
  def initialize(user_id)
    @user_id = user_id
  end

  def call
    JWT.encode({ user_id: user_id }, HMAC_SECRET, ALGORITHM)
  end

  private

  attr_reader :user_id
end