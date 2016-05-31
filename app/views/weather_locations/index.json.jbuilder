json.array!(@weather_locations) do |weather_location|
  json.extract! weather_location, :id, :weather_grid_id, :latitude, :longitude, :city
  json.url weather_location_url(weather_location, format: :json)
end
