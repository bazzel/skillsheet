class SkillSerializer < ActiveModel::Serializer
  attributes :id

  has_many :experiences
  belongs_to :technology
end
