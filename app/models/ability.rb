class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @all_families = @user.roles.where(resource_type: "Family")
    @parent_families, @user_families = @all_families.partition {|r| r.name == "admin" }

    @user.roles.each { |role| send(role.name) }
  end

  def admin
    can :manage, Task, family_id: @parent_families.map(&:id)
    can :manage, Family, id: @parent_families.map(&:resource_id)
    can :read, Family, id: @user_families.map(&:resource_id)
  end

  def user
    can :edit, Task, assignee_id: @user.id
    can :read, Family, id: @user_families.map(&:resource_id)
  end
end
