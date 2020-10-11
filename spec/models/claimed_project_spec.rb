require 'rails_helper'

RSpec.describe ClaimedProject, type: :model do
  it { should have_many(:project_stages) }
  it { should have_many(:project_milestones) }
  it { should have_many(:claimed_project_stats) }
  it { should belong_to(:project) }
end
