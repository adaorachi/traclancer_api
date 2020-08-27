class ProjectCategory < ApplicationRecord
  before_create :slugify

  has_many :projects

  validates :title, presence: true, length: { minimum: 3 }

  scope :project_all, -> { includes(:projects) }

  def slugify
    self.slug = title.parameterize
  end
end
