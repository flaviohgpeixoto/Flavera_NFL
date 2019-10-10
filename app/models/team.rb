# frozen_string_literal: true

##
# Model Team
#
class Team < ApplicationRecord
  ##
  # Setting relations between models
  #
  has_many :tripples
  has_many :players
  has_many :leagues, through: :tripples
  has_many :users, through: :tripples

  ##
  # Validates - name - mandatory and unique
  #
  validates :name, presence: true, uniqueness: true

  ##
  # Verifying numbers of player on a team
  #
  validate :check_max_players, on: :update

  def check_max_players
    self.errors[:players] = 'Team must have 53 players maximum.' if players.count >= 53
  end
end
