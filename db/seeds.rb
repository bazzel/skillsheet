# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.destroy_all

10.times do
  Employee.create(
    first_name: Faker::Name.first_name,
    middle_name: ['de', 'van' 'van den', nil].sample,
    last_name: Faker::Name.last_name,
    alumni: (rand(0..1) == 1))
end

p "%d employees added" % Employee.count

