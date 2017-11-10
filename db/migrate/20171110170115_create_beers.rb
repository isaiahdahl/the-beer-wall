class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.decimal :achohol_percent, precision: 4, scale: 2
      t.string :country
      t.references :wall_of_beer, foreign_key: true
      t.references :want, foreign_key: true

      t.timestamps
    end
  end
end
