class User < ActiveRecord::Base
  has_secure_password
  has_many :experiences, inverse_of: :user
  has_many :beers, through: :experiences

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email


end
