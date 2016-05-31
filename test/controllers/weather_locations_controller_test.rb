require 'test_helper'

class WeatherLocationsControllerTest < ActionController::TestCase
  setup do
    @weather_location = weather_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_location" do
    assert_difference('WeatherLocation.count') do
      post :create, weather_location: { city: @weather_location.city, latitude: @weather_location.latitude, longitude: @weather_location.longitude, weather_grid_id: @weather_location.weather_grid_id }
    end

    assert_redirected_to weather_location_path(assigns(:weather_location))
  end

  test "should show weather_location" do
    get :show, id: @weather_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weather_location
    assert_response :success
  end

  test "should update weather_location" do
    patch :update, id: @weather_location, weather_location: { city: @weather_location.city, latitude: @weather_location.latitude, longitude: @weather_location.longitude, weather_grid_id: @weather_location.weather_grid_id }
    assert_redirected_to weather_location_path(assigns(:weather_location))
  end

  test "should destroy weather_location" do
    assert_difference('WeatherLocation.count', -1) do
      delete :destroy, id: @weather_location
    end

    assert_redirected_to weather_locations_path
  end
end
