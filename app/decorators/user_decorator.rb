class UserDecorator < Draper::Decorator
  delegate_all

  def with_role(family)
    self.has_cached_role?(:admin, family) ? :admin : :user 
  end

  def rating
    Task.where(assignee: self).average(:rating) || 0
  end

  def birthday_formatted
    birthday&.strftime('%d/%m/%Y')
  end
end
