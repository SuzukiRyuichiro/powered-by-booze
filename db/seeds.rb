# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

50.times do
  cocktail_url = open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read
  cocktail_json = JSON.parse(cocktail_url)
  new_cocktail = Cocktail.new(
    name: cocktail_json['drinks'][0]['strDrink'],
    imageURL: cocktail_json['drinks'][0]['strDrinkThumb'],
    instruction: cocktail_json['drinks'][0]['strInstructions']
    )

  puts "#{new_cocktail.name} is valid? #{new_cocktail.valid?}"
  next unless new_cocktail.valid?

  puts "creating a cocktail named #{new_cocktail.name}"
  puts "#{new_cocktail.instruction}"
  new_cocktail.save!
  i = 1

  while cocktail_json["drinks"][0]["strIngredient#{i}"] && cocktail_json["drinks"][0]["strIngredient#{i}"] != "" do
    new_ingredient = Ingredient.new(name: cocktail_json["drinks"][0]["strIngredient#{i}"])
    new_ingredient.valid? ? new_ingredient.save : new_ingredient = Ingredient.find_by(name: new_ingredient.name)
    description = cocktail_json["drinks"][0]["strMeasure#{i}"] || "1"
    new_dose = Dose.new(description: description, cocktail: new_cocktail, ingredient: new_ingredient)
    new_dose.save!
    puts "#{new_cocktail.name} has #{new_dose.description} of #{new_ingredient.name}"
    i += 1
  end

  6.times do
    new_review = Review.new(
      content: Faker::Quote.yoda,
      name: Faker::Movies::StarWars.character,
      rating: (0..5).to_a.sample,
      )
    puts "#{new_review.name} says #{new_review.content}... and rate #{new_review.rating}"
    new_review.cocktail = new_cocktail
    next unless new_review.valid?
    new_review.save!
  end
end
