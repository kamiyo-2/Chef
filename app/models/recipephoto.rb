class Recipephoto < ApplicationRecord
  has_many_attached :images
  belongs_to :recipe, optional: true

  validates :text,        presence: true
  validates :images,     presence: true
end
