require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:description) }

  it { should belong_to(:author) }
  it { should belong_to(:assignee) }
end
