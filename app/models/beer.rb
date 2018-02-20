class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  has_many :experiences, inverse_of: :beer
  has_many :users, through: :experiences

  validates_presence_of :brewery, :style, :name
  validates_uniqueness_of :name
  validates :abv, presence: true, length: {in: 0..30}
end
