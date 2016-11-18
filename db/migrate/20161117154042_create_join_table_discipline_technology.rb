class CreateJoinTableDisciplineTechnology < ActiveRecord::Migration[5.0]
  def change
    create_join_table :disciplines, :technologies do |t|
      # t.index [:discipline_id, :technology_id]
       t.index [:technology_id, :discipline_id], name: :technology_discipline
    end
  end
end
