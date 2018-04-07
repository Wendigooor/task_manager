class Family < ApplicationRecord
  resourcify

  has_many :users, through: :roles
  has_many :tasks

  validates :name, presence: true
end
