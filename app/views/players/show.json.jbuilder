json.player do
  json.msg @destroy_message if @destroy_message.present?
  json.id @player.id
  json.name @player.name
  json.position @player.position
  json.team do
    json.id @player.team&.id
    json.name @player.team&.name
  end
end