class ApplicationController < ActionController::API
    include ::ErrorHandler
    include ::Authentication
end
