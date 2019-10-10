# frozen_string_literal: true

json.array! @players do |player|
  json.id player.id
  json.name player.name
  json.position player.position
  json.team_id  player.team_id
  json.team do
    json.name player.team&.name
  end
end
