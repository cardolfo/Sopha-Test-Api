module Authentication
  extend ActiveSupport::Concern

  included do
    def authorize_request
      token = token_authorization_header
      begin
        @decoded = Services::JwtService.decode(token)
        @current_user = User.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound
        raise Errors::RequestUnauthorized
      rescue JWT::DecodeError
        raise Errors::RequestUnauthorized
      end
    end

    def token_authorization_header
      authorization_header = request.headers['Authorization']
      parts_authorization_header = authorization_header&.split(' ')
      parts_authorization_header&.last
    end
  end
end
