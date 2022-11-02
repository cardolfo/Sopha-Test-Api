class ApplicationController < ActionController::API
    include ::ErrorHandler
    include ::Jwt
end
