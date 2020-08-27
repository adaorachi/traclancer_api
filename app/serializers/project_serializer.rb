class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project
  set_id :id
  attributes :title, :description, :amount, :owned_user_id, :claimed_user_id, :claimed, :completed, :attachment_url, :created_at

  belongs_to :project_category
  belongs_to :owned_user, record_type: :user
  belongs_to :claimed_user, record_type: :user
end
