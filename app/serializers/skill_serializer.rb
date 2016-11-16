class SkillSerializer < ActiveModel::Serializer
  attributes :id, :technology

  has_many :languages

  def technology
    object.technology_name
  end
end
