class AddIvStatsToPokeInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemon_infos, :iv_stats, :string
  end
end
