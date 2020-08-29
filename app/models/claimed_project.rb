class ClaimedProject < ApplicationRecord
  belongs_to :project
  has_many :project_stages

  belongs_to :claimed_user, class_name: 'User'
end
