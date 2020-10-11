require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_one(:claimed_project) }
  it { should belong_to(:project_category) }
  it { should belong_to(:owned_user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
