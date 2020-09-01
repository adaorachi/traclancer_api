module Api
  module V1
    class RegistrationsController < ApplicationController
      skip_before_action :require_login, only: [:create]
      # def create
      #   user = User.new(user_params)

      #   if user.save
      #     session[:user_id] = user.id
      #     render json: {
      #       status: :created,
      #       logged_in: true,
      #       user: user
      #     }
      #   else
      #     render json: { status: 401, logged_in: false, error: user.errors.full_messages }
      #   end
      # end

      def create
        user = User.create(user_params)
        if user.valid?
          payload = { user_id: user.id }
          token = encode_token(payload)
          render json: {
            user: user,
            status: :created,
            logged_in: true,
            jwt: token,
          }
        else
          render json: { status: 422, logged_in: false, error: user.errors.full_messages }
        end
      end

      def user_params
        params[:user].permit(:first_name, :last_name, :email, :username, :profile_image, :status, :password)
      end
    end
  end
end
