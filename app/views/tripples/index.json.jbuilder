# frozen_string_literal: true

json.array! @tripples do |tripple|
  json.id tripple.id
  json.user do
    json.id tripples.user&.id
    json.name tripples.user&.name
  end
  json.league do
    json.id tripples.league&.id
    json.name tripples.league&.name
  end
  json.team do
    json.id tripples.team&.id
    json.name tripples.team&.name
  end
end
