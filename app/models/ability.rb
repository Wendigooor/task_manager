class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @all_families = @user.roles.where(resource_type: "Family")
    @parent_families = @all_families.select{|r| r.name == "admin" }

    @user.roles.each { |role| send(role.name) }
  end

  def admin
    can :manage, Task, family_id: @parent_families.map(&:id)
    can :manage, Family, id: @parent_families.map(&:id)
  end

  def user
    can :edit, Task, assignee_id: @user.id
  end
end
