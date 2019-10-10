# frozen_string_literal: true

json.array! @leagues do |league|
  json.id league.id
  json.name league.name
end
