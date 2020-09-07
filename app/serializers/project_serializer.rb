class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :budget, :owned_user_id, :completed, :claimed, :attachment_url, :created_at

  attribute :owned_user do
    object.owned_user
  end
end
