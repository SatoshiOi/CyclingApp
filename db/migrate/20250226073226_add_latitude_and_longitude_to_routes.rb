class AddLatitudeAndLongitudeToRoutes < ActiveRecord::Migration[7.2]
  def change
    add_column :routes, :latitude, :float
    add_column :routes, :longitude, :float
  end
end
