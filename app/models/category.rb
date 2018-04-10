class Category < ApplicationRecord
  acts_as_tree order: :name

  has_and_belongs_to_many :tasks, join_table: :categories_tasks

  validates :name, presence: true
end
