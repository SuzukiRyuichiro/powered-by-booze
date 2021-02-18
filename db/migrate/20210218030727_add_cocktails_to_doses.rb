class AddCocktailsToDoses < ActiveRecord::Migration[6.1]
  def change
    add_reference :doses, :cocktail, null: false, foreign_key: true
  end
end
