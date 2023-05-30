class Product < ApplicationRecord
  belongs_to :user
  has_many :rentings, dependent: :destroy
  has_one_attached :photo
end
