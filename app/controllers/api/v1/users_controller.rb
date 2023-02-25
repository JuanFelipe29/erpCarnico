class Api::V1::UsersController < ApiController
  def index
    users = User.all
    render json: users, status: :ok
  end
 
  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def create
    auth_token = RegistrationService.call(user_params)

    render json: { auth_token: auth_token }, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end