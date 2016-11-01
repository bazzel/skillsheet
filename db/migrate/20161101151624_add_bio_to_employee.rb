class AddBioToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :bio, :text
  end
end
