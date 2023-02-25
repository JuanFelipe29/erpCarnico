class Api::V1::SuppliersController < ApiController
  def index
    render json: { a: 'Hello' }
  end
end