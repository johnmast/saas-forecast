module WeatherGridsHelper
  def forecast_to_css_mapping(forecast_icon)
      forecast_to_css_mapping = Hash.new
      forecast_to_css_mapping['clear-day']           = 'climacon sun' 
      forecast_to_css_mapping['clear-night']         = 'climacon moon'
      forecast_to_css_mapping['rain']                = 'climacon rain'
      forecast_to_css_mapping['snow']                = 'climacon snow'
      forecast_to_css_mapping['sleet']               = ''
      forecast_to_css_mapping['wind']                = 'climacon wind'
      forecast_to_css_mapping['fog']                 = 'climacon fog'
      forecast_to_css_mapping['cloudy']              = 'climacon cloud'
      forecast_to_css_mapping['partly-cloudy-day']   = 'climacon cloud sun'
      forecast_to_css_mapping['partly-cloudy-night'] = 'climacon cloud moon'
      return forecast_to_css_mapping[forecast_icon]
  end
end
