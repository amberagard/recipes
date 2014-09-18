class RecipeIngredients < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :unit, presence: true
  validates :amount, presence: true
end
