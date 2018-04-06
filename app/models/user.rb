class User < ApplicationRecord
  rolify
  include Registration

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  has_many :families, through: :roles, source: :resource, source_type: 'Family'

  validates :first_name,
            :last_name,
            presence: true

  ROLES = %w(admin user)
end
