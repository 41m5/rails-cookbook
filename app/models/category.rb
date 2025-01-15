class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
end
