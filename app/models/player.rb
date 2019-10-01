class Player < ApplicationRecord
  belongs_to :team, optional: :true

  enum positions: %i(QB RB WR TE K DST)

  before_save :manage_players_on_team

  ##
  #Validations
  #
  validates :name, presence: true

  def manage_players_on_team
    
    self.errors.add :team, "This team has 53 players." if team&.players&.count >= 53
  end


end
