class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :recipe_id, uniqueness: { scope: :category_id, message: "This already exists" }
  validates :comment, length: { minimum: 5 }, :allow_blank => true
end
