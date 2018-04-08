class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :task, presence: true
  validates :body, length: { in: 3..200 }
end
