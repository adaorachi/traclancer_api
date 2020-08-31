# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      include CurrentUserConcern

      def index
        projects = Project.all

        render json: ProjectSerializer.new(projects).serialized_json
      end

      def show
        project = Project.includes(:owned_user).find_by(id: params[:id])
        project_data = []
        project_data << { project: project }
        project_data << { owned_user: project.owned_user }
        render json: { data: project_data }
      end

      def create
        project = Project.new(project_params)

        if project.save
          render json: ProjectSerializer.new(project).serialized_json
        else
          render json: { error: project.errors.full_message, status: 422 }
        end
      end

      def update
        project = Project.find_by(id: params[:id])

        if project.update_column(:claimed, true)
          render json: ProjectSerializer.new(project).serialized_json
        else
          render json: { error: ['Cannot update claimed  status'], status: 422 }
        end
      end

      def delete
        project = Project.find_by(id: params[:id])

        if project.destroy
          head :no_content
        else
          render json: { error: project.errors.full_message, status: 422 }
        end
      end

      private

      def options
        @options ||= { include: %i[owned_user] }
      end

      def project_params
        params.require(:project)
              .permit(
                :title,
                :description,
                :budget,
                :owned_user_id,
                :completed,
                :claimed,
                :project_category_id,
                :attachment_url
              )
      end
    end
  end
end
