class CreateScoringCategories < ActiveRecord::Migration
  def change
    create_table :scoring_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
