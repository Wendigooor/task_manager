require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:family) { create(:family) }
  let(:admin) do
    u = create(:user)
    u.add_role(:admin, family)
    u
  end
  let(:task) { FactoryBot.create(:task, author: admin, family: family) }

  context 'when user has admin role' do
    let(:subject) { Ability.new(admin) }
    it 'has access to manage family' do
      is_expected.to be_able_to(:manage, family)
    end

    it 'has access to manage family tasks' do
      is_expected.to be_able_to(:manage, task)
    end
  end

  context 'when user has user role' do
    let(:user) do
      u = create(:user)
      u.add_role(:user, family)
      u
    end
    let(:subject) { Ability.new(user) }

    it 'cannot manage family' do
      is_expected.not_to be_able_to(:manage, family)
    end

    it 'has access to view family' do
      is_expected.to be_able_to(:show, family)
    end

    it 'cannot manage family tasks' do
      is_expected.not_to be_able_to(:manage, task)
    end

    it 'has access to view family tasks' do
      is_expected.to be_able_to(:show, task)
    end
  end

  context 'when user without role' do
    let(:user_without_role) { create(:user) }
    let(:subject) { Ability.new(user_without_role) }

    it 'cannot manage family' do
      is_expected.not_to be_able_to(:manage, family)
    end

    it 'has access to manage family tasks' do
      is_expected.not_to be_able_to(:manage, task)
    end
  end
end
