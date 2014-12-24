class CreateRosterSlots < ActiveRecord::Migration
  def change
    create_table :roster_slots do |t|
      t.integer :player_id
      t.integer :team_id
      t.integer :slot_id

      t.timestamps null: false
    end
  end
end
