# rubocop:disable Layout/LineLength

module Api
  module V1
    class ClaimedProjectsController < ApplicationController
      ## include CurrentUserConcern

      def index
        claimed_project = ClaimedProject.includes(:project_stages).includes(:project_milestones).includes(:claimed_project_stats).where(claimed_user_id: session_user.id)
        array = []
        claimed_project.each do |proj|
          inner_obj = {}
          inner_obj['attributes'] = proj
          inner_obj['projects'] = proj.project
          inner_obj['project_stages'] = proj.project_stages
          inner_obj['owned_user'] = proj.project.owned_user
          inner_obj['project_stats'] = proj.claimed_project_stats
          array << inner_obj
        end

        render json: { data: array }
      end

      def show
        claimed_project = ClaimedProject.includes(:project_stages).includes(:project_milestones).find_by(id: params[:id])
        array = []
        array << { claimed_projects: claimed_project }
        array << { project_stages: claimed_project.project_stages }
        array << { project_milestones: claimed_project.project_milestones }
        render json: { data: array }
      end

      def create
        claimed_project = ClaimedProject.new(project_claimed_params)

        if claimed_project.save
          render json: claimed_project, serializer: ClaimedProjectSerializer
        else
          render json: { error: claimed_project.errors.full_message, status: 422 }
        end
      end

      def update
        claimed_project = ClaimedProject.find_by(id: params[:id])

        if claimed_project.update(project_claimed_params)
          render json: ClaimedProjectSerializer.new(project).serialized_json
        else
          render json: { error: claimed_project.errors.full_message, status: 422 }
        end
      end

      def delete; end

      private

      def project_claimed_params
        params.require(:claimed_project).permit(:claimed_user_id, :project_id, :claimed, :completed, :time_spent, :rate)
      end
    end
  end
end
# rubocop:enable Layout/LineLength
