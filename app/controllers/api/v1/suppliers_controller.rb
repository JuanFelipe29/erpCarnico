class Api::V1::SuppliersController < ApiController
  before_action :authorized_user!

  def index
    render json: { a: 'Hello' }
  end
end