class CreateRoutes < ActiveRecord::Migration[7.2]
  def change
    create_table :routes do |t|
      t.string :title
      t.text :description
      t.integer :distance
      t.string :start_location
      t.string :end_location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
