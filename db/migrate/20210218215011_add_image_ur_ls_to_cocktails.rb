class AddImageUrLsToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :imageURL, :string
  end
end
