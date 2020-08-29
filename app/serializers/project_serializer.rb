# frozen_string_literal: true

class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project
  set_id :id
  attributes :title, :description, :amount, :owned_user_id, :claimed_user_id, :claimed, :completed, :attachment_url, :created_at

  belongs_to :owned_user, key: :user
  # do |movie, params|
  #   owned = User.find_by(id: 1)
  #   UserSerializer.new(owned)
  #   # params[:current_user].is_employee? ? true : false
  # end
  # belongs_to :claimed_user, record_type: :user
end
