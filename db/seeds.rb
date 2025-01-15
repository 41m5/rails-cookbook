# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

p "Cleaning the database...."
Bookmark.destroy_all
Recipe.destroy_all
p "Complete. Now loading recipes..."

require "open-uri"
require "json"

categories = ["Pasta", "Dessert", "Breakfast", "Vegetarian"]
recipes_by_category = {}

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipes_serialised = URI.open(url).read
  recipes = JSON.parse(recipes_serialised)
  recipes_by_category[category] = recipes
  five_recipes = recipes["meals"].first(5)
  # p five_recipes
  five_recipes.each do |recipe|
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{recipe["idMeal"]}"
    recipes_serialised = URI.open(url).read
    recipes_array_hash = JSON.parse(recipes_serialised)
    recipe_hash = recipes_array_hash["meals"][0]
      Recipe.create!(
      {
        name: recipe_hash["strMeal"],
        description: recipe_hash["strArea"],
        rating: 4,
        image_url: recipe_hash["strMealThumb"]
      }
    )
  end
end

p "Complete. Recipes loaded."

# recipes_by_category.each do |category, data|
#   # puts "Category: #{category}"
#   data["meals"].each do |meal|
#     puts "#{meal["idMeal"]}"
#   end
# end

# Recipe.destroy_all

# Recipe.create!([
#   {
#     name: recipe["strMeal"],
#     description: 'A classic Italian pasta dish with a rich, savory meat sauce.',
#     rating: 4,
#     image_url: 'https://plus.unsplash.com/premium_photo-1677000666741-17c3c57139a2?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
#   }
# ])
