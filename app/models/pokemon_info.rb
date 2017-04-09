class PokemonInfo < ApplicationRecord
  scope :current_spawn, -> (){where("despawns_at > ?", Time.now - 4.hours)}
  scope :expired, -> (){where("despawns_at < ?", Time.now - 4.hours )}
  scope :dratini, -> (){where("pokemon_name IN ('Dratini','Dragonair')")}
  scope :not_dratini, -> (){where("pokemon_name NOT IN ('Dratini','Dragonair')")}
  reverse_geocoded_by :latitude, :longitude
end
