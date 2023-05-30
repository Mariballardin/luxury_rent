class Product < ApplicationRecord
  belongs_to :user
  has_many :rentings, dependent: :destroy
end
