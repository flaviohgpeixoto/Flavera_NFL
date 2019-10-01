json.league do
  json.msg @destroy_message if @destroy_message.present?
  json.id @league.id
  json.name @league.name
end