module Api
  module V1
    class ClaimedProjectStatsController < ApplicationController
      def show
        claimed_project_stat = ClaimedProjectStat.includes(:claimed_project).find_by(id: params[:id])
        array = []
        array << { claimed_project: claimed_project_stat }
        array << { project_stages: claimed_project_stat.project_stages }
        render json: { data: array }
      end

      def create
        claimed_project_stat = ClaimedProjectStat.new(record_time: params[:record_time], claimed_project_id: params[:claimed_project_id])
        claimed_project_stat.start_time = Time.now

        if claimed_project_stat.save
          render json: ClaimedProjectStatSerializer.new(claimed_project_stat).serialized_json
        else
          render json: { error: claimed_project_stat.errors.full_message, status: 422 }
        end
      end

      def update
        claimed_project_stat = ClaimedProjectStat.last
        claimed_project_stat.end_time = Time.now

        if claimed_project_stat.update(record_time: params[:record_time], project_stage: params[:project_stage])
          claimed_project_stat.update_column(:end_time, Time.now)
          render json: ClaimedProjectStatSerializer.new(claimed_project_stat).serialized_json
        else
          render json: { error: claimed_project_stat.errors.full_message, status: 422 }
        end
      end

      private

      def project_claimed_stats_params
        params.require(:claimed_project_stat).permit(:record_time, :claimed_project_id, :project_stage)
      end
    end
  end
end
