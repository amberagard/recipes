class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def index
    @ingredients = Ingredient.all
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
