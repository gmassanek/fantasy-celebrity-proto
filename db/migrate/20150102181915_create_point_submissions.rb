class CreatePointSubmissions < ActiveRecord::Migration
  def change
    create_table :point_submissions do |t|
      t.string :proof_url
      t.integer :scoring_statistic_id
      t.float :points
      t.integer :player_id
      t.text :comment
      t.string :status

      t.timestamps null: false
    end
  end
end
