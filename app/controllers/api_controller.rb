class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  include Authorization
  include Serializable

  rescue_from ActiveRecord::RecordInvalid do |error|
    render json: { errors: error.record.errors.messages }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { message: "Couldn't find #{error.model}", type: error.class, model: error.model },
           status: :not_found
  end

  rescue_from StandardApiError do |error|
    render json: { message: error&.message, type: error.class, errors: error&.errors }, status: :bad_request
  end
end