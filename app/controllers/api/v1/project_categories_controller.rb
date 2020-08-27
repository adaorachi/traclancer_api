module Api
  module V1
    class ProjectCategoriesController < ApplicationController
      def index
        project_categories = []
        ProjectCategory.project_all.each do |project_cat|
          all_project_category = {}
          all_project_category['type'] = 'project'
          all_project_category['id'] = project_cat.id
          all_project_category['attributes'] = project_cat
          all_project_category['unclaimed_project_no'] = project_cat.projects.where(claimed: false).count
          project_categories << all_project_category
        end
        render json: { data: project_categories }
        # project_cats = ProjectCategory.all
        # render json: ProjectCategorySerializer.new(project_cats, options).serialized_json
      end

      def show
        project_cat = ProjectCategory.find_by(slug: params[:slug])

        render json: ProjectCategorySerializer.new(project_cat, options).serialized_json
      end

      def options
        @options ||= { include: %i[projects] }
      end

      private

      def project_cat_params
        params.require(:project_category).permit(:title, :description)
      end
    end
  end
end
