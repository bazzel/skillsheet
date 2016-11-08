class SkillSerializer < ActiveModel::Serializer
  attributes :id, :technology

  def technology
    object.technology_name
  end
end
