class CreateWallOfBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :wall_of_beers do |t|
      t.string :name

      t.timestamps
    end
  end
end
