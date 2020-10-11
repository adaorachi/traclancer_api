class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :username, :profile_image

  has_many :projects
end
