class Task < ApplicationRecord
  extend Enumerize

  resourcify
  acts_as_taggable

  belongs_to :author, class_name: :User
  belongs_to :assignee, class_name: :User, optional: true
  belongs_to :family

  has_many :comments, as: :commentable, dependent: :destroy
  has_and_belongs_to_many :categories, join_table: :categories_tasks

  enumerize :state, in: [:opened, :in_progress, :paused, :finished, :closed]

  validates :description,
            :author,
            presence: true

  delegate :first_name, to: :assignee, prefix: true, allow_nil: true
end
