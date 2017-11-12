class Beer < ApplicationRecord
  belongs_to :wall_of_beer, optional: true
  belongs_to :want, optional: true
  validates :name, presence: true

  def self.search(search)
    where("name LIKE ?", "%#{search.upcase}%")
  end
end
