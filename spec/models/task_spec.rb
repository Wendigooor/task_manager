require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:author) }

  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:assignee) }
  it { is_expected.to belong_to(:family) }

  it { is_expected.to have_many(:comments) }
end
