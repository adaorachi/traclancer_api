class ProjectMilestoneSerializer < ActiveModel::Serializer
  attributes :title, :description, :alloted_time, :time_spent

  belongs_to :claimed_project
  belongs_to :project_stage

  has_many :milestone_subtasks
end
