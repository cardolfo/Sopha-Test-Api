module Errors
  class SignupFailed < StandardError
    def initialize(errors_messages)
      super(errors_messages)
    end

    def status
      :internal_server_error
    end
  end
end
