require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should validate_presence_of(:name) }

  it { is_expected.to have_many(:roles) }
  it { is_expected.to have_many(:users).through(:roles) }
end
