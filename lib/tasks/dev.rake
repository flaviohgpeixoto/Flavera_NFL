# frozen_string_literal: true

namespace :dev do
##
# Task to import and create a basedate from a spreadsheet file of player and teams.
#
  desc 'Importing Players and Teams'
  task add_players_and_teams: :environment do
    xlsx = Roo::Spreadsheet.open('./tmp/players_and_team.xlsx')
    xlsx = xlsx.parse

    xlsx.each do |row|
      Team.find_or_create_by name: row[2]
    end

    xlsx.each do |row|
      Player.create name: row[0], position: row[1], team: Team.find_by(name: row[2])
    end
  end
end
