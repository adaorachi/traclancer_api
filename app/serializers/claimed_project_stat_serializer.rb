class ClaimedProjectStatSerializer < ActiveModel::Serializer
  attributes :start_time, :end_time, :record_time, :claimed_project, :project_stage

  belongs_to :claimed_project
end
