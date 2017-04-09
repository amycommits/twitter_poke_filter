class CreateAreaNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :area_notifications do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.float :lower_left_latitude
      t.float :lower_left_longitude
      t.float :upper_right_latitude
      t.float :upper_right_longitude

      t.timestamps
    end
  end
end
