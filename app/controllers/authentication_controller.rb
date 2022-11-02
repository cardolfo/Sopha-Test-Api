class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login
  
    # POST /auth/login
    def login
      @user = User.where(username: login_params[:username])
      @user = @user.first
      
      if @user.authenticate(login_params[:password])
        token = Auth::JwtToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                        username: @user.username }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end
  
    private
  
    def login_params
      params.require(:authentication).permit(:username, :password)
    end
  end
