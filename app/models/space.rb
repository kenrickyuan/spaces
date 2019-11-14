class Space < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy
  validates :owner, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ["house party", "wedding", "festival", "business", "dinner party", "drinks", "birthday", "coffee/high tea", "surprise", "baby shower", "celebration", "bridal shower", "weekend trip", "bbq"] }
  validates :price_per_hour, presence: true, numericality: true
  validates :max_occupancy, presence: true, numericality: { only_integer: true }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
