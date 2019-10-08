class Tripple < ApplicationRecord
  belongs_to :league
  belongs_to :team, optional: true
  belongs_to :user

  enum role: %i(std owner)

  validate :team_needed?

  def team_needed?
    if self.role == :std
      self.errors.add("User must select a team.")
    end
  end

end
