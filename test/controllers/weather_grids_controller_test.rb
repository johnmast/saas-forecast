require 'test_helper'

class WeatherGridsControllerTest < ActionController::TestCase
  setup do
    @weather_grid = weather_grids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_grids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_grid" do
    assert_difference('WeatherGrid.count') do
      post :create, weather_grid: { name: @weather_grid.name, user_id: @weather_grid.user_id }
    end

    assert_redirected_to weather_grid_path(assigns(:weather_grid))
  end

  test "should show weather_grid" do
    get :show, id: @weather_grid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weather_grid
    assert_response :success
  end

  test "should update weather_grid" do
    patch :update, id: @weather_grid, weather_grid: { name: @weather_grid.name, user_id: @weather_grid.user_id }
    assert_redirected_to weather_grid_path(assigns(:weather_grid))
  end

  test "should destroy weather_grid" do
    assert_difference('WeatherGrid.count', -1) do
      delete :destroy, id: @weather_grid
    end

    assert_redirected_to weather_grids_path
  end
end
