class CreatePointSubmissions < ActiveRecord::Migration
  def change
    create_table :point_submissions do |t|
      t.string :proof_url
      t.integer :scoring_statistic_id
      t.string :scoring_statistic_override
      t.float :points
      t.integer :player_id
      t.text :comment
      t.string :status

      t.timestamps null: false
    end

    add_index :point_submissions, :status
    add_index :point_submissions, :player_id
    add_index :point_submissions, :points
  end
end
