class SkillSerializer < ActiveModel::Serializer
  attributes :id, :technology, :languages

  def technology
    object.technology_name
  end

  def languages
    object.technology.languages.map(&:name)
  end
end
