class Team < ApplicationRecord
  has_many :tripples
  has_many :leagues, through: :tripples
  has_many :users, through: :tripples
end
