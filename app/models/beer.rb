class Beer < ApplicationRecord
  belongs_to :wall_of_beer, optional: true
  belongs_to :want, optional: true
  validates :name, presence: true
end
