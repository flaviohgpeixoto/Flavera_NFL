# frozen_string_literal: true

##
# Model User
#
class User < ActiveRecord::Base
  ##
  # Gem Devise.
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  include DeviseTokenAuth::Concerns::User

  ##
  # Setting relations between models
  #
  has_many :tripples
  has_many :leagues, through: :tripples
  has_many :teams, through: :tripples

  ##
  # Enumerating role for users.
  #
  enum role: %i[std admin]

  ##
  # Validates - name - mandatory // nickname and email - mandatory and unique
  #
  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
