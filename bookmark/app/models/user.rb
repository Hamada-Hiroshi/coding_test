class User < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_products, through: :bookmarks, source: :product

  validates :name, presence: true
end
