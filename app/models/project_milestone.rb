class ProjectMilestone < ApplicationRecord
  belongs_to :project
  belongs_to :project_stage

  has_many :milestone_subtasks

  validates :title, presence: true, length: { maximum: 3 }
  validates :description, presence: true, length: { maximum: 10 }
end
