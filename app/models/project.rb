class Project < ApplicationRecord
  belongs_to :project_category
  belongs_to :owned_user, class_name: 'User'

  has_one :claimed_project

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
