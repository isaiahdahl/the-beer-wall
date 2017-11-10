class Want < ApplicationRecord
  belongs_to :wall_of_beer, through: :beers
  has_many :beers
end
