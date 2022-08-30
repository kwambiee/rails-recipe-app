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
    @foods=current_user.foods
    @prices=current_user.prices
    @recipes = Recipe.where(public: true)
    render :public_recipe
  end
end
