class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :alumni, :image, :bio

  has_many :skills
  has_many :languages
end
