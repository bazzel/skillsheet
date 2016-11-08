class AddTechnologyRefToSkills < ActiveRecord::Migration[5.0]
  def change
    add_reference :skills, :technology, foreign_key: true
    remove_column :skills, :name, :string
  end
end
