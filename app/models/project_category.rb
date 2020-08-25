class ProjectCategory < ApplicationRecord
  before_create :slugify

  has_many :projects

  validates :title, presence: true, length: { maximum: 3 }

  def slugify
    self.slug = title.parameterize
  end
end
