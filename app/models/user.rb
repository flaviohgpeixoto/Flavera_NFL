# frozen_string_literal: true

##
# Relation between tripples, leagues and teams.
#
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  include DeviseTokenAuth::Concerns::User

  #
  # Associations
  #

  has_many :tripples
  has_many :leagues, through: :tripples
  has_many :teams, through: :tripples

  #
  # Enumerators
  #

  enum role: %i[std admin]

  #
  # Validates
  #

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
