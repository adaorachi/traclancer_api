module Api
  module V1
    class ProjectMilestonesController < ApplicationController
      def show
        project_milestone = ProjectMilestone.find_by(id: params[:id])

        render json: ProjectMilestoneSerializer.new(project_milestone, options).serialized_json
      end

      def create
        project_milestone = ProjectMilestone.new( project_milestone_params)

        if project_milestone.save
          render json: ProjectMilestoneSerializer.new(project_milestone).serialized_json
        else
          render json: { error: project_milestone.errors.full_message, status: 422 }
        end
      end

      def options
        @options ||= { include: %i[milestone_subtasks] }
      end

      private

      def project_milestone_params
        params.require(:project_milestone)
          .permit(
            :title, :description, :alloted_time, :time_spent
          )
      end
    end
  end
end
