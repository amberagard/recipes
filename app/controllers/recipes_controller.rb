class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe_ingredient = RecipeIngredient.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all
    commontator_thread_show(@recipe)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :recipe_ingredients_attributes => [:amount, :unit, :ingredient_id])
  end
end
