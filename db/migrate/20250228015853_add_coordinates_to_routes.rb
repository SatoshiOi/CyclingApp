class AddCoordinatesToRoutes < ActiveRecord::Migration[7.2]
  def change
    add_column :routes, :start_lat, :float
    add_column :routes, :start_lng, :float
    add_column :routes, :end_lat, :float
    add_column :routes, :end_lng, :float
  end
end
