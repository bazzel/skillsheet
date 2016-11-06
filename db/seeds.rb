# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.destroy_all

10.times do
  Employee.create do |employee|
    employee.first_name = Faker::Name.first_name
    employee.middle_name = ['de', 'van', 'van den', nil].sample
    employee.last_name = Faker::Name.last_name
    employee.alumni = (rand(0..1) == 1)
    employee.image = Faker::Avatar.image
    employee.bio = Faker::Lorem.paragraphs(rand(2..8)).join("\n\n")

    rand(1..20).times do
      employee.skills << Skill.new.tap do |skill|
        skill.name = Faker::Hacker.adjective
      end
    end
  end
end

p "%d employees added" % Employee.count
