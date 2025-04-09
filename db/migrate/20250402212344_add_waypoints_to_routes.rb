class AddWaypointsToRoutes < ActiveRecord::Migration[7.2]
  def change
    add_column :routes, :waypoints, :json
  end
end
