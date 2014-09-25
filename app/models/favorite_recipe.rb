class FavoriteRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  validates :recipe, uniqueness: { scope: :user, message: "should only have one per user" }
end
