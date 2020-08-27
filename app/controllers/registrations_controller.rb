module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        user = User.new(user_params)

        if user.save
          session[:user_id] = user.id
          render json: {
            status: :created,
            logged_in: true,
            user: user
          }
        else
          render json: { status: 401, logged_in: false, error: user.errors.full_messages }
        end
      end

      def user_params
        params[:user].permit(:first_name, :last_name, :email, :username, :image_url, :password)
      end
    end
  end
end
