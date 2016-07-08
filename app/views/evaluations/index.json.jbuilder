json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id
  json.url evaluation_url(evaluation, format: :json)
end
