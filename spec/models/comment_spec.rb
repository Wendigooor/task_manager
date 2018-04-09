require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:task) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_length_of(:body).is_at_least(3).on(:create) }

  it { is_expected.to belong_to(:task) }
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:commentable) }

  it { is_expected.to have_many(:comments) }
end
