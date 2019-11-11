class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :location
      t.text :description
      t.integer :price_per_hour
      t.string :category
      t.string :photo
      t.integer :max_occupancy
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
