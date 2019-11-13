class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable, :confirmable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spaces, dependent: :destroy, foreign_key: 'owner_id'
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
end
