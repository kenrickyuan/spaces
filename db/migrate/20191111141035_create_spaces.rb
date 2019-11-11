class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :location
      t.string :description
      t.integer :price_per_hour
      t.string :category
      t.blob :photo
      t.integer :max_occupancy

      t.timestamps
    end
  end
end
