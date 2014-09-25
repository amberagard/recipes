class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user

  acts_as_commontable

  accepts_nested_attributes_for :recipe_ingredients,
                                reject_if: proc { |ri| ri[:ingredient_id].blank? && ri[:amount].blank? && ri[:unit].blank? }
end
