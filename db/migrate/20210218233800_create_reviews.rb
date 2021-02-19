class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :name
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
