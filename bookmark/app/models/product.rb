class Product < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user

  validates :name, presence: true
  validates :price, presence: true
end
