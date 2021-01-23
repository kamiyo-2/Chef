class Tag < ApplicationRecord
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :recipes, through: :recipe_tag_relations
  validates :name, :tag_image ,presence: true
  has_one_attached :tag_image

  
end