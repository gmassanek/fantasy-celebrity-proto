class CreateLeagueRosterSlots < ActiveRecord::Migration
  def change
    create_table :league_roster_slots do |t|
      t.integer :position_id
      t.integer :league_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
