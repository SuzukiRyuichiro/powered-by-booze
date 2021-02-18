# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  new_cocktail = Cocktail.create(name: Faker::Beer.name)
  new_cocktail.save!
  2.times do
    new_ingredient = Ingredient.create(name: Faker::Food.ingredient)
    new_ingredient.save!
    new_dose = Dose.new(description: Faker::Food.measurement, cocktail: new_cocktail, ingredient: new_ingredient)
    new_dose.save!
  end
end
