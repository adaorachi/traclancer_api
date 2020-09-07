class ProjectCategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :slug

  has_many :projects do
    object.projects.where(claimed: false)
  end
end
