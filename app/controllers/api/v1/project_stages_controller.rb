module Api
  module V1
    class ProjectStagesController < ApplicationController
      def show
        project_stage = ProjectStage.find_by(id: params[:id])

        render json: ProjectStageSerializer.new(project_stage, options).serialized_json
      end


      def create
        project_stage = ProjectStage.new(project_stage_params)

        if project_stage.save
          render json: ProjectStageSerializer.new(project_stage).serialized_json
        else
          render json: { error: project_stage.errors.full_message, status: 422 }
        end
      end

      def options
        @options ||= { include: %i[project_milestones] }
      end

      private

      def project_stage_params
        params.require(:project_stage)
          .permit(
            :title, :description, :rate, :share, :estimated_time, :claimed_project_id
          )
      end
    end
  end
end
