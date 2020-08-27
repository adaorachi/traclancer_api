class ProjectStageSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project_stage
  set_id :id
  attributes :title, :description, :rate, :share, :estimated_time

  belongs_to :project
  has_many :project_milestones
end