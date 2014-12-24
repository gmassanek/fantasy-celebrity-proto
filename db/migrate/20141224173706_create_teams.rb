class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title
      t.integer :league_id

      t.timestamps null: false
    end
  end
end
