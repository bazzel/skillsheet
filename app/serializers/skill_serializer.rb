class SkillSerializer < ActiveModel::Serializer
  attributes :id, :technology

  has_many :languages
  has_many :disciplines
  has_many :experiences

  def technology
    object.technology_name
  end
end
