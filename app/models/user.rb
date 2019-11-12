class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :spaces, inverse_of: 'User', dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
end
