class JwtServices::DecodeToken < JwtServices::JwtBase
  class TokenDecodingError < StandardApiError; end

  def initialize(auth_token)
    @auth_token = auth_token
  end
  
  def call
    JWT.decode(auth_token, HMAC_SECRET, true, { algorithm: ALGORITHM })[0]["user_id"]
  rescue JWT::DecodeError
    raise TokenDecodingError
  end

  private

  attr_reader :auth_token
end