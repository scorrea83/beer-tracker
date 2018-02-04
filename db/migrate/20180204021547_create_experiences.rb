class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.integer :beer_id
      t.decimal :rating, precision: 3, scale: 2
      t.string :comments
      t.timestamps null: false
    end
  end
end
