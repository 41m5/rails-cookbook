class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category
  validates :recipe_id, uniqueness: { scope: :category_id, message: "This already exists" }
  validates :comment, length: { minimum: 6, too_short: "Comment too short (minimum is %{count} characters)"}
end
