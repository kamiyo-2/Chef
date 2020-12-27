class Recipephoto < ApplicationRecord
  has_one_attached :sub_image
  belongs_to :recipe, optional: true

  validates :text,        presence: true
  validates :sub_image,     presence: true
end
