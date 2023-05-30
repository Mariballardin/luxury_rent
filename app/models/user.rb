class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :rentings, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 40 }
end
