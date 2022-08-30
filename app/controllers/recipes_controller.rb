class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end


  def show
    @recipe = Recipe.find(params[:id])
  end


  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def public_recipes
    @name = Recipe.where(public: true)
    recipes = Recipe.where(public: true).pluck(:id)
    # recipes =recipes.pluck(:id)
    foods = RecipeFood.where(recipe_id: recipes).pluck(:food_id).uniq
    food_count = foods.count
    # @recipes = Recipe.includes(:user, recipe_foods: [:food]).where(users: {public: true}).order(created_at: :desc)
    render :public_recipe
  end
end
