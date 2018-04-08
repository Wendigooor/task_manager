class Task < ApplicationRecord
  extend Enumerize

  resourcify
  acts_as_taggable

  belongs_to :author, class_name: :User
  belongs_to :assignee, class_name: :User, optional: true

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :all_comments, class_name: :Comment

  enumerize :state, in: [:opened, :in_progress, :paused, :finished, :closed], default: :opened

  validates :description,
            :author,
            presence: true
end
