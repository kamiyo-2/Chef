class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foodstuffs
  has_many :recipephotos

  has_one_attached :main_image

  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations, dependent: :destroy

  validates :title, :details, :process, :main_image, presence: true
end
