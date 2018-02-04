class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :brewery_id
      t.integer :style_id
      t.decimal :abv, precision: 3, scale: 1
      t.integer :ibu
      t.string :description
      t.timestamps null: false
    end
  end
end
