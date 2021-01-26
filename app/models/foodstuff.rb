class Foodstuff < ApplicationRecord
  belongs_to :recipe, optional: true

  validates :material, presence: true
  validates :quantity, presence: true
  
end