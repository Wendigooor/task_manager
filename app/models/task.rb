class Task < ApplicationRecord
  extend Enumerize

  resourcify
  acts_as_taggable

  belongs_to :author, class_name: :User
  belongs_to :assignee, class_name: :User, optional: true

  enumerize :state, in: [:opened, :in_progress, :paused, :finished, :closed], default: :opened

  validates :description,
            :author,
            presence: true
end
