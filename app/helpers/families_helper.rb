module FamiliesHelper

  def user_role(user, family)
    user.has_cached_role?(:admin, family) ? :admin : :user 
  end

end
