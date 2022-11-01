module Errors
    class StoreNotFound < StandardError
      def initialize(
        msg = I18n.t(
          "errors.store_not_found"
        )
      )
        super(msg)
      end

      def status
        :not_found
      end
    end
end