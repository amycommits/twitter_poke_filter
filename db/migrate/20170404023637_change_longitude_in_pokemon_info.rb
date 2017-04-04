class ChangeLongitudeInPokemonInfo < ActiveRecord::Migration[5.0]
  def up
    change_column :pokemon_infos, :longitude, :float
  end
  def down
    change_column :pokemon_infos, :longitude, :string
  end
end
