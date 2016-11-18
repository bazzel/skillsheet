class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :level
      t.date :started_on
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
