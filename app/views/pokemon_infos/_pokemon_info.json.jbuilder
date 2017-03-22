json.extract! pokemon_info, :id, :pokemon_name, :despawns_at, :iv_value, :channel, :coordinates, :latitude, :longitude, :short_url, :long_url, :description, :created_at, :updated_at
json.url pokemon_info_url(pokemon_info, format: :json)
