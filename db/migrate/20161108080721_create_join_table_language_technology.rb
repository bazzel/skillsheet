class CreateJoinTableLanguageTechnology < ActiveRecord::Migration[5.0]
  def change
    create_join_table :languages, :technologies do |t|
      # t.index [:language_id, :technology_id]
       t.index [:technology_id, :language_id]
    end
  end
end
