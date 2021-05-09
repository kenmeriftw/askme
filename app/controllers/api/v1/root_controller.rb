module Api
  module V1
    class RootController < ActionController::Base
      before_action :enforce_json_request_type
      before_action :ensure_user_authorized

      attr_reader :current_user

      helper_method :current_user

      private

      def enforce_json_request_type
        request.format = 'json'
      end

      def ensure_user_authorized
        token = request.headers['Authorization'].gsub(/\ABearer /, '')

        result = User.where.not(api_token: nil).find_by(api_token: token)

        return head(403) unless result
      end
    end
  end
end
