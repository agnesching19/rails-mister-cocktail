require "open-uri"
require "json"

Cocktail.destroy_all
Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "A new ingredient #{ingredient['strIngredient1']} is created!"
end

cocktails = [
  { name: "Old Fashioned"
    },
  { name: "Daiquiri"
    },
  { name: "Margarita"
    },
  { name: "Sidecar"
    },
  {
    name: "French 75"
    },
  {
    name: "Bloody Mary"
    },
  {
    name: "Irish Coffee"
    },
  {
    name: "Jack Rose"
    },
  {
    name: "Negroni"
    },
  {
    name: "Boulevardier"
    },
  {
    name: "Sazerac"
    },
  {
    name: "Vieux Carré"
    },
  {
    name: "Ramos Gin Fizz"
    },
  {
    name: "Mint Julep"
    },
  {
    name: "Whiskey Sour"
    },
  {
    name: "Mai Tai"
    },
  {
    name: "Planter's Punch"
    },
  {
    name: "Pisco Sour"
    },
  {
    name: "Cosmopolitan"
    },
  {
    name: "Tom Collins"
    },
  {
    name: "Last Word"
    },
]

cocktails.each { |cocktail| Cocktail.create(cocktail) }



