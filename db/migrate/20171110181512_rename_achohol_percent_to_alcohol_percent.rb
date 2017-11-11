class RenameAchoholPercentToAlcoholPercent < ActiveRecord::Migration[5.1]
  def change
    rename_column :beers, :achohol_percent, :alcohol_percent
  end
end
