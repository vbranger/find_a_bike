# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Station.destroy_all
p Station.count

url = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_information.json'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

user["data"]["stations"].each do |station|
  Station.create!(station_id: station['station_id'], 
                  name: station['name'], 
                  lat: station['lat'], 
                  lon: station['lon'],
                  capacity: station['capacity'],
                  stationCode: station['stationCode'])
  p Station.last
end




