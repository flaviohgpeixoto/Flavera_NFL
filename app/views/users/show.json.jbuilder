json.user do
  json.msg @destroy_message if @destroy_message.present?
  json.id @user.id
  json.name @user.name
  json.nickname @user.nickname
  json.email @user.email
end