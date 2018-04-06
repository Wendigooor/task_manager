require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { is_expected.to have_and_belong_to_many(:roles) }
  it { is_expected.to have_many(:families).through(:roles) }
end
