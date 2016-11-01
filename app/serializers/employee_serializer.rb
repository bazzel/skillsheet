class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :alumni, :image
end
