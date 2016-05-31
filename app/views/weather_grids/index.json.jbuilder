json.array!(@weather_grids) do |weather_grid|
  json.extract! weather_grid, :id, :name, :user_id
  json.url weather_grid_url(weather_grid, format: :json)
end
