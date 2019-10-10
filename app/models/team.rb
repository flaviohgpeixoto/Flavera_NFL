# frozen_string_literal: true

##
# Relation between users, leagues and tripples
#
class Team < ApplicationRecord
  #
  # Associations
  #

  has_many :tripples
  has_many :players
  has_many :leagues, through: :tripples
  has_many :users, through: :tripples

  #
  # Validations
  #

  validates :name, presence: true, uniqueness: true
  validate :check_max_players, on: :update

  ##
  # Verifying numbers of player on a team
  #

  def check_max_players
    errors.add(:players, 'Team must have 53 players maximum.') if players.count >= 53
  end
end
