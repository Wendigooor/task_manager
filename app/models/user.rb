class User < ApplicationRecord
  include Registration

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  has_many :roles
  has_many :families, through: :roles

  validates :first_name,
            :last_name,
            presence: true
end
