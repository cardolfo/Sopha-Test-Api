module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :request_error_handler

    private

    def request_error_handler(error)
      error_handler(error)

      render json: @error, status: @status, error: true
    end

    def error_handler(error)
      @status = error.try(:status) || :internal_server_error
      error_type = parameterize_error(error.class)
      messages = [get_message(error)]

      @error = {
        success: false,
        status: @status,
        error_type: error_type,
        errors: messages
      }
    end

    def parameterize_error(error_class)
      error_class
        .to_s
        .split('::')
        .last
        .titleize
        .parameterize(separator: '_')
    end

    def get_message(error)
      error
        .message
        .try(:split, '|')
    end
  end
end
