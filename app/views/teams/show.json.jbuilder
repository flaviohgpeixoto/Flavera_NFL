# frozen_string_literal: true

json.team do
  json.msg @destroy_message if @destroy_message.present?
  json.id @team.id
  json.name @team.name
end
