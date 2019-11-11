class Space < ApplicationRecord
  belongs_to :owner
  has_many :bookings, inverse_of: :space, dependant: :destroy
  validates :owner, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :category, presence: true
  validates :price_per_hour, presence: true, numericality: true
  validates :max_occupancy, presence: true, numericality: { only_integer: true }
  validates :photo
end
