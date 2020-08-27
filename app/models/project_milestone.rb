class ProjectMilestone < ApplicationRecord
  belongs_to :project
  belongs_to :project_stage

  has_many :milestone_subtasks

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
