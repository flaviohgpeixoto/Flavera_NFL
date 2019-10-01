class League < ApplicationRecord
  has_many :tripples
  has_many :teams, through: :tripples
  has_many :users, through: :tripples

  ##
  #Validating numbers of team in a league
  #
  validates :name, presence: true, uniqueness: :true
  validate :check_teams_on_league, on: :update

  def check_teams_on_league
    self.errors.add :teams, message: "League must have 32 teams!" if teams.count != 32
  end
end
