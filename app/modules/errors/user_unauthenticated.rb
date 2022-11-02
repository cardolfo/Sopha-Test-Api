module Errors
  class UserUnauthenticated < StandardError
    def initialize(
      msg = I18n.t(
        'errors.user_unauthenticated'
      )
    )
      super(msg)
    end

    def status
      :precondition_failed
    end
  end
end
