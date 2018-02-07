class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  validates_presence_of :user, :beer
  validates :rating, presence: true, inclusion: {in: [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 4.25, 4.5, 4.75, 5] }
end
