class Ability
  include CanCan::Ability

  def initialize(user)
    @user.roles.each { |role| send(role) }
  end

  def admin
  end

  def user
  end
end
