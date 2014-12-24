class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.string :abbreviation, :length => 4

      t.timestamps null: false
    end
  end
end
