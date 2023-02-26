class Api::V1::SessionsController < ApiController
  def create
    auth_token = SessionService.call(session_params)

    render json: { auth_token: auth_token }, status: :created
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end