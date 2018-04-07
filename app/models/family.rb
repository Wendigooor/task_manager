class Family < ApplicationRecord
  resourcify

  has_many :users, through: :roles

  validates :name, presence: true
end
