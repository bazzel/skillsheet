class Skill < ApplicationRecord
  validates :name, uniqueness: { scope: :employee_id }
end
