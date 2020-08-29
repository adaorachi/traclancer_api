class ClaimedProject < ApplicationRecord
  belongs_to :project
  has_many :project_stages
  has_many :project_milestones

  belongs_to :claimed_user, class_name: 'User'
end
