class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :alumni, :image, :bio
end
