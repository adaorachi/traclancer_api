# frozen_string_literal: true

module Api
  module V1
    class ProjectCategoriesController < ApplicationController
      def custom(array)
        inner_obj = {}
        inner_obj['type'] = 'project'
        inner_obj['id'] = array.id
        inner_obj['attributes'] = array
        inner_obj['unclaimed_project_no'] = array.projects.where(claimed: false).count
        inner_obj
      end

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
      end

      def custom2(project_cat)
        push_array = []
        push_array << { project_category: project_cat }
        array = []
        project_cat.projects.each do |cat|
          cats = Project.includes(:owned_user).where(
            owned_user_id: cat.owned_user_id,
            id: cat.id,
            claimed: false,
            completed: false)
          inner_obj = {}
          inner_obj['attributes'] = cats[0]
          inner_obj['owned_user'] = cat.owned_user
          array << inner_obj
        end
        push_array << array
        push_array
      end

      def show
        project_cat = ProjectCategory.includes(:projects).find_by(slug: params[:slug])

        render json: { data: custom2(project_cat) }
      end

      def options
        @options ||= { include: %i[projects projects.owned_user_id] }
      end

      private

      def project_cat_params
        params.require(:project_category).permit(:title, :description)
      end
    end
  end
end
