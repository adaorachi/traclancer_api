module Api
  module V1
    class ProjectsController < ApplicationController
      include CurrentUserConcern

      def index
        projects = Project.all

        render json: Project.new(projects).serialized_json
      end

      def show
        project = Project.find_by(id: params[:id])

        render json: Project.new(project).serialized_json
      end

      def create
        project = Project.new(project_params)

        if project.save
          render json: Project.new(project).serialized_json
        else
          render json: { error: project.errors.full_message, status: 422 }
        end
      end

      def update
        project = Project.find_by(id: params[:id])

        if project.update(project_params)
          render json: Project.new(project).serialized_json
        else
          render json: { error: project.errors.full_message, status: 422 }
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

      def claimed_projects
        claimed_projects = Project.claimed_projects(@current_user)
        render json: Project.new(claimed_projects).serialized_json
      end

      def available_projects
        project_cat = ProjectCategory.find_by(slug: params[:slug])
        project_cat_projects = project_cat.projects.where(claimed: false, completed: false)
        render json: Project.new(project_cat_projects).serialized_json
      end

      def completed_projects
        completed_projects = Project.completed_projects(@current_user)
        render json: Project.new(completed_projects).serialized_json
      end

      def created_projects
        created_projects = Project.created_projects(@current_user)
        render json: Project.new(created_projects).serialized_json
      end

      private

      def project_params
        params.require(:project)
          .permit(
            :title,
            :description,
            :amount,
            :owned_user_id,
            :claimed_user_id,
            :claimed,
            :completed,
            :attachment_url
          )
      end
    end
  end
end
