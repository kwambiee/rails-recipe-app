class RecipeFoodsController < ApplicationController

  def new
    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(food_params)
    redirect_to recipe_path(params[:recipe_id]), notice: "Successfully updated the food."
  end


  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id]), notice: "Successfully deleted the food."
  end

  private

  def food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end