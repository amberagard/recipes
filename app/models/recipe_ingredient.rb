class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :unit, presence: true
  validates :amount, presence: true

  def ingredient_name
    ingredient.name
  end
end
