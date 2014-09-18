class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipie, index: true
      t.references :ingredient, index: true
      t.integer :amount
      t.string :unit

      t.timestamps
    end
  end
end
