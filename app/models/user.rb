class User < ApplicationRecord
  before_save :set_user_attribute, :set_profile_image
  has_secure_password

  enum status: [:freelancer, :client]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :first_name, presence: true, length: { in: 3..50 }
  validates :last_name, presence: true, length: { in: 3..50 }
  validates :username, presence: true, length: { in: 3..50 },
                       uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :status, presence: true
  validates :password, presence: true, length: { maximum: 255 }

 private

  def set_user_attribute
    self.email = email.downcase
    self.username = username.downcase
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
    self.password_confirmation = self.password
  end

  def set_profile_image
    avatar = gravatar_for(self.email)
    self.profile_image = avatar
  end

  def gravatar_for(email, size: 80)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    gravatar_url
  end
end
