class Employee < ApplicationRecord
  def full_name
    [first_name, middle_name, last_name].join(' ')
  end
end
