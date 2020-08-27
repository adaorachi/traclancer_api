class MilestoneSubtaskSerializer
  include FastJsonapi::ObjectSerializer
  set_type :milestone_subtasks
  set_id :id
  attributes :title, :description

  belongs_to :project_milestone
end
