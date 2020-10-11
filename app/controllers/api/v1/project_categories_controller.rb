module Api
  module V1
    class ProjectCategoriesController < ApplicationController
      def index
        project_cats = ProjectCategory.includes(:projects).all

        render json: project_cats, each_serializer: ProjectCategorySerializer
      end

      def show
        project_cat = ProjectCategory.includes(:projects).find_by(slug: params[:slug])

        render json: project_cat, each_serializer: ProjectCategorySerializer
      end

      private

      def project_cat_params
        params.require(:project_category).permit(:title, :description)
      end
    end
  end
end
