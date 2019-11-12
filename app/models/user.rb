class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable

  devise :database_authenticatable, :registerable, # confirmable taken out for now until new migration for confirmable column is done
         :recoverable, :rememberable, :validatable, :trackable
  has_many :spaces, dependent: :destroy, foreign_key: 'owner_id'
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
end
