class Skill < ApplicationRecord
  belongs_to :technology
  has_many :languages, through: :technology

  validates :technology_id, uniqueness: { scope: :employee_id }

  delegate :name, to: :technology, prefix: true
end
