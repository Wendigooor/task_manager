class TaskDecorator < Draper::Decorator
  delegate_all

  def assignee_first_name
    self.assignee&.first_name
  end

  def truncated_description(n = 20)
    description.truncate(n)
  end
end
