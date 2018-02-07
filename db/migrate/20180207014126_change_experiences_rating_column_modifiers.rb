class ChangeExperiencesRatingColumnModifiers < ActiveRecord::Migration
  def change
    change_column :experiences, :rating, :float, precision: 3, scale: 2
  end
end
