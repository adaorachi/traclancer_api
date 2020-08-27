class ProjectStage < ApplicationRecord
  belongs_to :project
  has_many :project_milestones

  validates :title, presence: true, length: { maximum: 3 }
  validates :description, presence: true, length: { maximum: 10 }
end
