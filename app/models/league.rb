class League < ApplicationRecord
  has_many :tripples
  has_many :teams, through: :tripples
  has_many :users, through: :tripples
end
