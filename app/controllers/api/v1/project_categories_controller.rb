module Api
  module V1
    class ProjectCategoriesController < ApplicationController
      def index
        arr = []
        ProjectCategory.project_all.each do |project_cat|
          inner_obj = {}
          inner_obj['type'] = 'project'
          inner_obj['id'] = project_cat.id
          inner_obj['attributes'] = project_cat
          inner_obj['unclaimed_project_no'] = project_cat.projects.where(claimed: false).count
          arr << inner_obj
        end
        render json: { data: arr }
      end

      def show
        project_cat = ProjectCategory.includes(:projects).find_by(slug: params[:slug])

        render json: { data: get_project_assoc(project_cat) }
      end

      def options
        @options ||= { include: %i[projects] }
      end

      private

      def project_cat_params
        params.require(:project_category).permit(:title, :description)
      end

      def get_project_assoc(project_cat)
        push_array = []
        push_array << { project_category: project_cat }
        array = []
        cats = Project.where(
          project_category_id: project_cat.id,
          claimed: false,
          completed: false
        )
        cats.each do |cat|
          inner_obj = {}
          inner_obj['attributes'] = cat
          inner_obj['owned_user'] = cat.owned_user
          array << inner_obj
        end
        push_array << array
        push_array
      end
    end
  end
end
