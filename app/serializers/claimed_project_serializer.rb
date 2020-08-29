class ClaimedProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_type :claimed_project
  set_id :id
  attributes :claimed_user_id, :claimed, :completed, :time_spent, :rate

  belongs_to :claimed_user, key: :user
  belongs_to :project
  has_many :project_stages
  has_many :project_milestones
end
