class User < ActiveRecord::Base
  has_secure_password
  has_many :experiences, inverse_of: :user
  has_many :beers, through: :experiences

  validates_presence_of :username, :email, :name
  validates_uniqueness_of :username, :email

  def slug
    self.username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end


end
