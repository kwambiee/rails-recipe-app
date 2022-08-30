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
    # @recipe = Recipe.find(params[:id])
    @result = []
    @recipes = Recipe.includes(:user).where(user: current_user, public: true)
    @recipes.each do |recipe|
      total = 0
      recipe.foods.each do |food|
        total += food.price
      end
      @result << { title: recipe.name, user: recipe.user.name, count: recipe.foods.size, price: total }
    end
    render :public_recipe
  end
end
