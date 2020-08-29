class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project
  set_id :id
  attributes :title, :description, :amount, :owned_user_id, :attachment_url, :created_at

  belongs_to :owned_user, key: :user
  has_one :claimed_project
end
