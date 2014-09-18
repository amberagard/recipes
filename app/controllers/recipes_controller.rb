class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
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
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name)
    end
end
