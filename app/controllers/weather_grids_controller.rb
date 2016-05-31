class WeatherGridsController < ApplicationController
  before_action :set_weather_grid, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  
  # GET /weather_grids
  # GET /weather_grids.json
  def index
    @weather_grids = WeatherGrid.all
  end

  # GET /weather_grids/1
  # GET /weather_grids/1.json
  def show
    @weather_locations = WeatherLocation.where(:weather_grid => @weather_grid)
  end

  # GET /weather_grids/new
  def new
    @weather_grid = WeatherGrid.new
  end

  # GET /weather_grids/1/edit
  def edit
  end

  # POST /weather_grids
  # POST /weather_grids.json
  def create
    @weather_grid = WeatherGrid.new(weather_grid_params)
    @weather_grid.user = current_user
    
    respond_to do |format|
      if @weather_grid.save
        format.html { redirect_to @weather_grid, notice: 'Weather grid was successfully created.' }
        format.json { render :show, status: :created, location: @weather_grid }
      else
        format.html { render :new }
        format.json { render json: @weather_grid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_grids/1
  # PATCH/PUT /weather_grids/1.json
  def update
    respond_to do |format|
      if @weather_grid.update(weather_grid_params)
        format.html { redirect_to @weather_grid, notice: 'Weather grid was successfully updated.' }
        format.json { render :show, status: :ok, location: @weather_grid }
      else
        format.html { render :edit }
        format.json { render json: @weather_grid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_grids/1
  # DELETE /weather_grids/1.json
  def destroy
    @weather_grid.destroy
    respond_to do |format|
      format.html { redirect_to weather_grids_url, notice: 'Weather grid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_grid
      @weather_grid = WeatherGrid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_grid_params
      params.require(:weather_grid).permit(:name, :user_id)
    end
end
