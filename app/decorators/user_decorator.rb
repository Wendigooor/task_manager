class UserDecorator < Draper::Decorator
  delegate_all

  def with_role(family)
    self.has_cached_role?(:admin, family) ? :admin : :user 
  end
end
