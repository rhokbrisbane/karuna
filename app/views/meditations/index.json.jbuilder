json.array!(@meditations) do |meditation|
  json.extract! meditation, :id, :name, :description, :media_url
  json.url meditation_url(meditation, format: :json)
end
