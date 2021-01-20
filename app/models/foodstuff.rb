class Foodstuff < ApplicationRecord
  belongs_to :recipe, optional: true

  validates :material, presence: true, length: { maximum: 20 }
  validates :quantity, presence: true, length: { maximum: 10 }
  
end