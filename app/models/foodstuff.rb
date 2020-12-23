class Foodstuff < ApplicationRecord
  belongs_to :recipe

  validates :material, presence: true, length: { maximum: 20 }
  validates :quantity, presence: true, length: { maximum: 10 }
end