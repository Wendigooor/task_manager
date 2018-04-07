class Task < ApplicationRecord
  resourcify

  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  enum state: %w(opened in_process paused finished closed)

  validates :description, presence: true
end
