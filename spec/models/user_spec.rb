require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:projects).dependent(:destroy) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:password) }
end
