module Errors
  class RequestUnauthorized < StandardError
    def initialize(
      msg = I18n.t(
        'errors.request_unauthorized'
      )
    )
      super(msg)
    end

    def status
      :unauthorized
    end
  end
end
