class AddLocationToPokeInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemon_infos, :location, :string
  end
end
