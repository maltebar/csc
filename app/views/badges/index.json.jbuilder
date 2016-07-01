json.array!(@badges) do |badge|
  json.extract! badge, :id
  json.url badge_url(badge, format: :json)
end
