# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :project_category
  belongs_to :owned_user, class_name: 'User'
  # belongs_to :claimed_user, class_name: 'User'

  has_many :project_stages
  has_many :project_milestones

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :amount, presence: true

  scope :claimed_projects, ->(current_user) { where('claimed_user_id = ? and claimed = ? and completed = ?', current_user, true, false) }
  scope :completed_projects, ->(current_user) { where('claimed_user_id = ? and claimed = ? and completed = ?', current_user, true, true) }
  scope :created_projects, ->(current_user) { where('owned_user_id = ? and claimed = ? and completed = ?', current_user, false, false) }
  scope :available_projects, ->(project_slug) { where('slug = ? and completed = ? and claimed = ?', project_slug, false, false) }
end