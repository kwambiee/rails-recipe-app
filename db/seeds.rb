# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Recipe.create(name: "Parmesan Crusted Chicken", preparation_time: "00:30:00", cooking_time: "01:00:00", description: "Parmesan crusted chicken is a great dish to add to your repertoire. It's easy enough to make for a weeknight dinner but also elegant enough for company, and it appeals to the whole family.", public: true, user_id: 1)
Recipe.create(name: "Creamy Baked Mac and Cheese", preparation_time: "00:10:00", cooking_time: "0:30:00", description: "This baked mac and cheese is a family favorite recipe, loved by both children and adults. It uses a combination of cheeses, layered in the dish as well as melted into a rich and creamy cheese sauce, for the ultimate in cheesy deliciousness!  Perfect for a comforting dinner or as a holiday side dish!", public: true, user_id: 1)
Recipe.create(name: "Perfect Baked Potato", preparation_time: "01:00:00", cooking_time: "0:30:00", description: "A perfect baked potato is hard to beat. The outside is brown and crisp, coated in a crust of sea salt. Pierce the skin, and your fork gives way to a soft, fluffy interior.", public: false, user_id: 1)
Recipe.create(name: "Kenyan Beef Samosas", preparation_time: "01:30:00", cooking_time: "0:45:00", description: "Kenyan samosas are fun to make and freeze very well. They’re so versatile, you can use whatever ground meat and vegetables you happen to have. Just make sure to make extra for snacking on later.", public: true, user_id: 1)
Recipe.create(name: "Kenyan Kebabs", preparation_time: "00:30:00", cooking_time: "0:45:00", description: "Kenyan kebabs are a specialty of my country, and are the perfect savoury mid-morning or late-evening snack, along with a cup of Kenyan tea. They are easy to prepare and taste absolutely amazing, especially when served with some sort of tamarind sauce to dip into.", public: false, user_id: 1)

Food.create(name: "Chicken", measurement_unit: "pound", price: 5.00)
Food.create(name: "Beef", measurement_unit: "kgs", price: 9.00)
Food.create(name: "Rice", measurement_unit: "kgs", price: 5.00)

RecipeFood.create(quantity: 3, food_id: 1, recipe_id: 1)
RecipeFood.create(quantity: 4, food_id: 2, recipe_id: 2)
RecipeFood.create(quantity: 4, food_id: 1, recipe_id: 2)
RecipeFood.create(quantity: 10, food_id: 3, recipe_id: 3)
RecipeFood.create(quantity: 5, food_id: 3, recipe_id: 1)

Inventory.create(name:"Meat inventory", description:"Meat has 40 purchases", user_id: 1)
Inventory.create(name:"Rice inventory", description:"Rice has 100 purchases", user_id: 1)
Inventory.create(name:"Chicken inventory", description:"Chicken has 20 purchases", user_id: 1)
Inventory.create(name:"Beef inventory", description:"Beef has 80 purchases", user_id: 1)

InventoryFood.create(quantity: 20, food_id: 1, inventory_id: 1)
InventoryFood.create(quantity: 40, food_id: 2, inventory_id: 1)
InventoryFood.create(quantity: 80, food_id: 3, inventory_id: 1)
InventoryFood.create(quantity: 100, food_id: 3, inventory_id: 1)

