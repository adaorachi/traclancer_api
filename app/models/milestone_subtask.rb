class MilestoneSubtask < ApplicationRecord
  belongs_to :project_milestone

  validates :title, presence: true, length: { maximum: 3 }
  validates :description, presence: true, length: { maximum: 10 }
end
