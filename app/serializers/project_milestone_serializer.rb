class ProjectMilestoneSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project_milestone
  set_id :id
  attributes :title, :description, :alloted_time, :time_spent

  belongs_to :project
  belongs_to :project_stage

  has_many :milestone_subtasks
end
