class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foodstuffs, dependent: :destroy
  has_many :recipephotos, dependent: :destroy
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations, dependent: :destroy

  has_one_attached :main_image

  enum status:{nonrelease: 0, release: 1}

  validates :title, :details, :process, :main_image, presence: true

  def self.search(search)
    return Recipe.all unless search
    Recipe.where(['title LIKE ?', "%#{search}%"])
    Recipe.where(['process LIKE ?', "%#{search}%"])
    Recipe.where(['details LIKE ?', "%#{search}%"])
  end
end
