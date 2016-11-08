class Skill < ApplicationRecord
  belongs_to :technology
  delegate :name, to: :technology, prefix: true
end
