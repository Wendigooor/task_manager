class User < ApplicationRecord
  rolify
  include Registration

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  has_many :families, through: :roles, source: :resource, source_type: 'Family'
  has_many :author_tasks, foreign_key: :author_id, class_name: 'Task'
  has_many :assigned_tasks, foreign_key: :assigne_id, class_name: 'Task'

  validates :first_name,
            :last_name,
            presence: true

  ROLES = %w(admin user)
end
