json.admin do
  json.msg @destroy_message if @destroy_message.present?
  json.id @admin.id
  json.name @admin.name
  json.email @admin.email
end