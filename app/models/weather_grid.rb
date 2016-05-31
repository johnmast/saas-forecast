class WeatherGrid < ActiveRecord::Base
  belongs_to :user
  has_many :weather_locations, :dependent => :destroy
end
