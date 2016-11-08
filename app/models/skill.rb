class Skill < ApplicationRecord
  belongs_to :technology
  has_many :languages, through: :technology

  delegate :name, to: :technology, prefix: true
end
