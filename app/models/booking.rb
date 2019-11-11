class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :user
  validates :startime, presence: true
  validates :endtime, presence: true
  validates_associated :space
  validates_associated :user
end
