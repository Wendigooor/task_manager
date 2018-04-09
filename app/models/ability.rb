class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @families = Family.with_role(:admin, @user)
    @user_families = Family.with_role(:user, @user)

    @user.roles.each { |role| send(role.name) }
  end

  def admin
    can :manage, Task, family_id: family_ids
    can :manage, Family, id: family_ids
  end

  def user
    can :edit, Task, assignee_id: @user.id
    can :read, Task, family_id: user_family_ids
    can :read, Family, id: user_family_ids
  end

private

  def family_ids
    @family_ids ||= @families.map(&:id)
  end

  def user_family_ids
    @user_family_ids ||= @user_families.map(&:id)
  end
end
