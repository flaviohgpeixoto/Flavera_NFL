class Team < ApplicationRecord
  has_many :tripples
  has_many :players
  has_many :leagues, through: :tripples
  has_many :users, through: :tripples

  ##
  #Validating maximum player in a team
  #
  validates :name, presence: true, uniqueness: :true
  validate :check_max_players, on: :update

  def check_max_players
    self.errors[:players] = "Team must have 53 players maximum." if players.count >= 53 
  end

end
