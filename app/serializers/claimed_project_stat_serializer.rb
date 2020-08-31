class ClaimedProjectStatSerializer
  include FastJsonapi::ObjectSerializer
  set_type :claimed_project_stat
  set_id :id
  attributes :start_time, :end_time, :record_time, :claimed_project, :project_stage

  belongs_to :claimed_project
end