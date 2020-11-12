require 'json'
require 'open-uri'

Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

result = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

drinks.each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
