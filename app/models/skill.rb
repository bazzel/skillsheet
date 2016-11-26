class Skill < ApplicationRecord
  belongs_to :technology
  has_many :experiences, -> { order(:started_on) }, dependent: :destroy

  validates :technology_id, uniqueness: { scope: :employee_id }

  delegate :name, to: :technology, prefix: true
end
