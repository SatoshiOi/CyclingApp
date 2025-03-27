class AddRouteIdToRuns < ActiveRecord::Migration[7.2]
  def change
    add_column :runs, :route_id, :bigint
  end
end
