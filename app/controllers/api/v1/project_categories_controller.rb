module Api
  module V1
    class ProjectCategoriesController < ApplicationController
      def index
        project_cats = ProjectCategory.all

        render json: ProjectSerializer.new(project_cats).serialized_json
      end

      def show
        project_cat = ProjectCategory.find_by(slug: params[:slug])

        render json: ProjectSerializer.new(project_cat).serialized_json
      end

      def options
        @options ||= { include: %i[project_categories] }
      end

      private

      def project_cat_params
        params.require(:project).permit(:title, :description)
      end
    end
  end
end
