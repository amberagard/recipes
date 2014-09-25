class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :unit, presence: true
  validates :amount, presence: true

  validates :recipe_id, uniqueness: {scope: :ingredient_id}

  def ingredient_name
    ingredient.name
  end
end
