class Role < ApplicationRecord
  belongs_to :family
  belongs_to :user

  validates :name, presence: true

  enum name: %w(admin user)
end
