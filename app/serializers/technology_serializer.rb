class TechnologySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :languages
  has_many :disciplines
end
