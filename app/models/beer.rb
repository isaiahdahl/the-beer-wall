class Beer < ApplicationRecord
  belongs_to :wall_of_beer
  belongs_to :want
  validates :name, presence: true
end
