class CreateScoringStatistics < ActiveRecord::Migration
  def change
    create_table :scoring_statistics do |t|
      t.text :description
      t.integer :scoring_category_id
      t.float :suggested_points

      t.timestamps null: false
    end
  end
end
