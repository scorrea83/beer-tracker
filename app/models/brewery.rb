class Brewery < ActiveRecord::Base
  has_many :beers, inverse_of: :brewery
  has_many :styles, through: :beers

  validates_presence_of :name, :country

end
