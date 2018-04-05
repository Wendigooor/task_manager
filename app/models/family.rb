class Family < ApplicationRecord

  has_many :roles
  has_many :users, through: :roles

  has_many :parent_roles, -> { where(name: :admin) }, class_name: 'Role'
  has_many :chlldren_roles, -> { where(name: :user) }, class_name: 'Role'
  has_many :parents, through: :parent_roles, source: :user
  has_many :childrens, through: :chlldren_roles, source: :user

  validates :name, presence: true
end
