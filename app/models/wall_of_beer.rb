class WallOfBeer < ApplicationRecord
  has_many :beers
  has_many :wants, through: :beers
end
