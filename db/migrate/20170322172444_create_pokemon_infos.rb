class CreatePokemonInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_infos do |t|
      t.string :pokemon_name
      t.datetime :despawns_at
      t.string :iv_value
      t.string :channel
      t.string :coordinates
      t.string :latitude
      t.string :longitude
      t.string :short_url
      t.string :long_url
      t.string :description

      t.timestamps
    end
  end
end
