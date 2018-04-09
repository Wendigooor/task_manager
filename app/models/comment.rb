class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :author, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :restrict_with_error

  validates :body, length: { in: 3..200 }
  validates :task,
            :author,
            presence: true
end
