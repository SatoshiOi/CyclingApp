class ChangeWaypointsToJsonInRoutes < ActiveRecord::Migration[7.2]
  def change
    change_column :routes, :waypoints, :json
  end
end
