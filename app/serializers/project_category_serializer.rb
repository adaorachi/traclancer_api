class ProjectCategorySerializer
  include FastJsonapi::ObjectSerializer
  set_type :project_category
  set_id :id
  attributes :title, :description, :slug

  has_many :projects
end
