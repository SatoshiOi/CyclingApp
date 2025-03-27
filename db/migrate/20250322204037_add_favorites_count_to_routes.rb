class AddFavoritesCountToRoutes < ActiveRecord::Migration[7.2]
  def change
    add_column :routes, :favorites_count, :integer, default: 0
  end
end
