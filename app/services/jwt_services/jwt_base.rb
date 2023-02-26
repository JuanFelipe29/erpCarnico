class JwtServices::JwtBase < ApplicationService
  HMAC_SECRET = Rails.application.secret_key_base
  ALGORITHM = "HS256"
end