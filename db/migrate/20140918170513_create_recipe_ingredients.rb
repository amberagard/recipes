class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe
      t.references :ingredient
      t.integer :amount
      t.string :unit

      t.timestamps
    end
  end
end
