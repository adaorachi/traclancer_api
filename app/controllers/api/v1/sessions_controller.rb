module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :require_login, only: %i[login logged_in logout]
      # include CurrentUserConcern

      def login
        user = User.find_by(username: params['user']['username'])
        if user&.authenticate(params['user']['password'])
          payload = { user_id: user.id }
          token = encode_token(payload)
          render json: {
            user: user,
            status: :created,
            logged_in: true,
            jwt: token
          }
        else
          render json: { status: 422, logged_in: false, error: ['Wrong Username/Password'] }
        end
      end

      def logged_in
        if session_user
          render json: {
            status: :logged_in,
            logged_in: true,
            user: session_user
          }
        else
          render json: {
            status: :not_logged_in,
            logged_in: false
          }
        end
      end

      def user_is_loggedin
        render json: { message: 'You are authorized' }
      end

      def logout
        # reset_session
        render json: { status: :logged_out, logged_out: true }
      end
    end
  end
end
