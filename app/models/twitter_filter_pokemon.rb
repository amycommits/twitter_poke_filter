class TwitterFilterPokemon < ApplicationRecord
  scope :current_spawn, -> (){where("despawns_at > ?", Time.now - 4.hours)}
  scope :expired, -> (){where("despawns_at < ?", Time.now - 4.hours )}
end
