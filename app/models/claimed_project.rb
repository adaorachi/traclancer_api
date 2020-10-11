class ClaimedProject < ApplicationRecord
  belongs_to :project
  has_many :project_stages
  has_many :project_milestones
  has_many :claimed_project_stats

  belongs_to :claimed_user, class_name: 'User'
end
