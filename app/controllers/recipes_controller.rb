class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe_ingredient = RecipeIngredient.new
  end

  def index
    @recipes = Recipe.all
  end

  # def search
  #   term = params[:search]
  #   ingredient = Ingredient.where(:name => term)
  #   @recipes = Ingredient.find(ingredient).recipes
  # end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  # def edit
  #   @recipe = Recipe.find(params[:id])
  # end
  #
  # def update
  #   @recipe = Recipe.find_by_id(params[:id])
  #   if @recipe.update(recipe_params)
  #     redirect_to recipe_path
  #   else
  #     render :new
  #   end
  # end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all
    commontator_thread_show(@recipe)
  end

  def favorite
    @recipe = Recipe.find(params[:id])
    type = params[:type]
    if type == "favorite"
      @favorite = current_user.favorite_recipes.create(recipe: @recipe)
      if @favorite.valid?
        redirect_to :back, notice: "You favorited #{@recipe.name}"
      else
        redirect_to :back, notice: "#{@recipe.name} has already been added to your favorites"
      end
    elsif type == "unfavorite"
      current_user.favorites.delete(@recipe)
      redirect_to :back, notice: "You unfavorited #{@recipe.name}"
    else
      redirect_to :back
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :description, :instructions, :recipe_ingredients_attributes => [:amount, :unit, :ingredient_id, :recipe_id])
    end
end
