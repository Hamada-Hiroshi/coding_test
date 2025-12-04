class User < ApplicationRecord
  has_many :reservations
  has_many :meeting_rooms, through: :reservations

  validates :name, presence: true
end
