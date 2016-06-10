json.array!(@assignments) do |assignment|
  json.extract! assignment, :id
  json.url assignment_url(assignment, format: :json)
end
