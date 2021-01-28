require 'json'
require 'open-uri'


class RequestsController < ApplicationController

  def index
    @request = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.save
    redirect_to root_path, notice: "Request créée"
  end

  def localization
    p "STTTTTTTTTTTTTTTTTAAAAAAAAAAAAAAAAAAARRRRRRRRRRRRRRTTTTTTTTTTTTTTTTTTTTTTT"
    @request = Request.new(latitude: params[:lat], longitude: params[:lon])
    @request.address = Geocoder.search([@request.latitude, @request.longitude]).first.address
    @request.save
    @stations = Station.near([@request.latitude, @request.longitude], 0.5, units: :km)
    p @stations
    stations_status = call_api
    @stations.each_with_index do |station, index|
        new_result = Result.new
        new_result.station = Station.find(station.id)
        new_result.request =  @request
        new_result.num_bikes = get_ebike_from_api(station.station_id, stations_status)
        new_result.save
    end
    
    redirect_to root_path(request: @request)
  end

  private

  def call_api
    url = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_status.json'
    stations_status_serialized = open(url).read
    stations_status = JSON.parse(stations_status_serialized)
  end

  def get_ebike_from_api(station_id, stations_status)
    station = stations_status["data"]["stations"].select {|station| station["station_id"] == station_id}
    p station
    result = station.first['num_bikes_available_types'][1]["ebike"]
    return result
  end

end
