module Api
  module V1
    class MilestoneSubtasksController < ApplicationController
      def index
        render json: { status: 'It is working' }
      end
    end
  end
end
