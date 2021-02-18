class AddIngredientsToDoses < ActiveRecord::Migration[6.1]
  def change
    add_reference :doses, :ingredient, null: false, foreign_key: true
  end
end
