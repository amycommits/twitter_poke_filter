class ChangeLatitudeInPokemonInfos < ActiveRecord::Migration[5.0]
  def up
	change_column :pokemon_infos, :latitude, :float 
  end
  def down
       change_column :pokemon_infos, :latitude, :string
  end
end
