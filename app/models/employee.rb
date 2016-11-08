class Employee < ApplicationRecord
  has_many :skills, dependent: :destroy
  has_many :languages, -> { distinct }, through: :skills

  def full_name
    [first_name, middle_name, last_name].join(' ')
  end
end
