class CreateRuns < ActiveRecord::Migration[7.2]
  def change
    create_table :runs do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :ran_at

      t.timestamps
    end
  end
end
