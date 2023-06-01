class Product < ApplicationRecord
  CATEGORY = %w(Art Bags Clothes Jewelry Shoes)
  belongs_to :user
  has_many :rentings, dependent: :destroy
  has_one_attached :photo

  validates :photo, presence: true
end
