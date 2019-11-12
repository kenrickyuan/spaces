class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates_associated :space
  validates_associated :user
end
