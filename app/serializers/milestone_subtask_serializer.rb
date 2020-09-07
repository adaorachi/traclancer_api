class MilestoneSubtaskSerializer < ActiveModel::Serializer
  attributes :title, :description

  belongs_to :project_milestone
end
