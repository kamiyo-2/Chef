class Recipephoto < ApplicationRecord
  belongs_to :recipe, optional: true
  has_one_attached :sub_image
  
  validates :text, presence: true
end
