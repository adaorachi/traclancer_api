class ProjectStage < ApplicationRecord
  belongs_to :claimed_project
  has_many :project_milestones

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
