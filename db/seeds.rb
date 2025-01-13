# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Recipe.create([
  {
    name: 'Spaghetti Bolognese',
    description: 'A classic Italian pasta dish with a rich, savory meat sauce.',
    rating: 9,
    image_url: 'https://plus.unsplash.com/premium_photo-1677000666741-17c3c57139a2?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
    name: 'Chicken Curry',
    description: 'A spicy and aromatic curry made with tender chicken pieces.',
    rating: 8,
    image_url: 'https://plus.unsplash.com/premium_photo-1723708871094-2c02cf5f5394?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
    name: 'Vegetable Stir Fry',
    description: 'A quick stir fry with assorted fresh vegetables and soy sauce.',
    rating: 7,
    image_url: 'https://plus.unsplash.com/premium_photo-1664472637341-3ec829d1f4df?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
    name: 'Beef Tacos',
    description: 'Tacos with seasoned ground beef, fresh toppings, and a soft corn shell.',
    rating: 8,
    image_url: 'https://images.unsplash.com/photo-1504544750208-dc0358e63f7f?q=80&w=2834&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  }
])

puts "4 recipes with image URLs created!"
