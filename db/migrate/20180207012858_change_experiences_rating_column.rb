class ChangeExperiencesRatingColumn < ActiveRecord::Migration
  def change
    change_column :experiences, :rating, :float
  end
end
