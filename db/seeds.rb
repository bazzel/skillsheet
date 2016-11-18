# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.destroy_all
Technology.destroy_all
Language.destroy_all
Discipline.destroy_all

%w(Java PHP JavaScript Python Objective-C Ruby Perl C C++ C# SQL Swift Elixir Elm).each do |name|
  Language.create name: name
end

['Web development', 'DevOps', 'Scrum', 'Mobile development'].each do |name|
  Discipline.create name: name
end

50.times do
  Technology.create do |t|
    t.name = Faker::Hacker.adjective
    t.languages = Language.all.sample(rand(2..5))
    t.disciplines = Discipline.all.sample(rand(1..3))
  end
end

50.times do
  Employee.create do |employee|
    employee.first_name = Faker::Name.first_name
    employee.middle_name = ['de', 'van', 'van den', nil].sample
    employee.last_name = Faker::Name.last_name
    employee.alumni = (rand(0..1) == 1)
    employee.image = Faker::Avatar.image
    employee.bio = Faker::Lorem.paragraphs(rand(2..8)).join("\n\n")

    rand(1..20).times do
      employee.skills << Skill.new.tap do |skill|
        skill.technology = Technology.all.sample
      end
    end
  end
end

puts "%d languages added" % Language.count
puts "%d technologies added" % Technology.count
puts "%d employees added" % Employee.count
puts "%d skill added" % Skill.count
