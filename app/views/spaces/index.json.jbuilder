json.array!(@spaces) do |space|
  json.extract! space, :id, :latitude, :longitude, :address, :description, :name
  json.url space_url(space, format: :json)
end
