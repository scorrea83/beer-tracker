class Style < ActiveRecord::Base
  has_many :beers, inverse_of: :style
  has_many :breweries, through: :beers

  validates :name, presence: true, uniqueness: true
end
