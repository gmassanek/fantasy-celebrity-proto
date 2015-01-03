class CreatePlayerTransactions < ActiveRecord::Migration
  def change
    create_table :player_transactions do |t|
      t.integer :player_id
      t.string :action
      t.integer :team_id
      t.integer :old_position_id
      t.integer :new_position_id

      t.timestamps null: false
    end
  end
end
