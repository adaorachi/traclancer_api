class ProjectStageSerializer < ActiveModel::Serializer
  attributes :title, :description, :share, :estimated_time

  belongs_to :claimed_project
  has_many :project_milestones
end
