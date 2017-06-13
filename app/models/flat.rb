class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_attachment :photo

  validates :title, :price, :address, :description, :bedrooms, :capacity, :category, presence: true

end
