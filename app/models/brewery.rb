class Brewery < ActiveRecord::Base
  has_many :beers, inverse_of: :brewery
  has_many :styles, through: :beers

  validates_presence_of :name, :country
  validates_uniqueness_of :name

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    Brewery.all.find{|brewery| brewery.slug == slug}
  end

end
