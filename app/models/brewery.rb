class Brewery < ActiveRecord::Base
  has_many :beers, inverse_of: :brewery
  has_many :styles, through: :beers

  validates_presence_of :name, :country

  def slug
    self.username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
