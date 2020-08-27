class MilestoneSubtask < ApplicationRecord
  belongs_to :project_milestone

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
