class FamilyMemberRemoverService

  def initialize(user_id, family)
    @user_id = user_id
    @family = family
  end

  def perform
    return if @user_id.blank?

    user = User.find(@user_id)
    User::ROLES.each do |role|
      user.remove_role(role, @family)
    end
  end

end
