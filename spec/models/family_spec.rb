require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should validate_presence_of(:name) }

  it { should have_many(:roles) }
  it { should have_many(:users).through(:roles) }
end
