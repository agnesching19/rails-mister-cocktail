require "open-uri"
require "json"

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "A new ingredient #{ingredient['strIngredient1']} is created!"
end




