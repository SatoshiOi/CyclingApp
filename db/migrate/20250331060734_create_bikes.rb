class CreateBikes < ActiveRecord::Migration[7.2]
  def change
    create_table :bikes do |t|
      t.string :image
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
