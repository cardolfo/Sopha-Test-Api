class UserController < ApplicationController
  def signin
    user = User.find_by(username: user_params[:username])
    token = Services::UserService.signin(user, user_params[:password])
    render_token(token)
  end

  def signup
    user = User.new(username: user_params[:username], password: user_params[:password], email: user_params[:email])
    token = Services::UserService.signup(user)
    render_token(token)
  end

  private

  def render_token(token)
    time = Time.now + 24.hours.to_i
    render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M') }, status: :ok
  end

  def user_params
    params.permit(:username, :password, :email)
  end
end
