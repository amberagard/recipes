class AddInstructionsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :instructions, :text
  end
end
