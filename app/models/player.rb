class Player < ApplicationRecord
  belongs_to :team

  enum positions: %i(QB RB WR TE K DST)
end
