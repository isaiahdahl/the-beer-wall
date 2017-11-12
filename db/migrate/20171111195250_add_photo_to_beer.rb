class AddPhotoToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :photo, :string
  end
end
