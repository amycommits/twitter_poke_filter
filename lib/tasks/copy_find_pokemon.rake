require 'twitter'
require 'net/http'

namespace :copy_find_pokemon do
  desc "Uses twitter API to get the latest Pokemon alerts"
  task :geotest => :environment do
    distance = 0.5
    center_point = [38.878930, -77.069412]
    arlingtonCemetery = Geocoder::Calculations.bounding_box([38.878930, -77.069412], 0.5)
  @latitude = 38.875647
  @longitude = -77.064078
  puts (@latitude > arlingtonCemetery[0] && @latitude < arlingtonCemetery[2] && @longitude > arlingtonCemetery[1] && @longitude < arlingtonCemetery[3])

  #92
    #orig_lat = 38.80322572377616
    #orig_long = -77.03922037092123
    #[38.86807511626668, -77.08335579697265, 38.88978488373331, -77.05546820302735]
    #PokemonInfo.where("latitude between ? and ?", arlingtonCemetery[0],arlingtonCemetery[2]).where("longitude between ? and ?", arlingtonCemetery[1], arlingtonCemetery[3])
    # puts [38.878930, -77.069302].within_bounding_box(arlingtonCemetery)
  end
end
