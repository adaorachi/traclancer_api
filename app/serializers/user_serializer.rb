class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :username, :profile_image, :password_digest

  has_many :projects
end