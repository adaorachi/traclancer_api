require 'rails_helper'

RSpec.describe ProjectCategory, type: :model do
  it { should have_many(:projects) }

  it { should validate_presence_of(:title) }
end
