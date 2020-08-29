# frozen_string_literal: true

module Api
  module V1
    class ClaimedProjectsController < ApplicationController
      def create
        claimed_project = ClaimedProject.new(project_claimed_params)

        if claimed_project.save
          render json: ClaimedProjectSerializer.new(claimed_project).serialized_json
        else
          render json: { error: claimed_project.errors.full_message, status: 422 }
        end
      end

      def show; end

      def update
        claimed_project = ClaimedProject.find_by(id: params[:id])

        if claimed_project.update(project_claimed_params)
          render json: ClaimedProjectSerializer.new(project).serialized_json
        else
          render json: { error: claimed_project.errors.full_message, status: 422 }
        end
      end

      def delete; end

      def project_claimed_params
        params.require(:project).permit(:claimed_user_id, :project_id, :claimed, :completed, :time_spent, :rate)
      end
    end
  end
end
