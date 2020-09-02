require 'rails_helper'

RSpec.describe ClaimedProjectStat, type: :model do
  it { should belong_to(:claimed_project) }
end
