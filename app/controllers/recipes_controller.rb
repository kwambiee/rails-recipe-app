class RecipesController < ApplicationController
  # before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
  end

  # # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_recipe
  #     @recipe = Recipe.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def recipe_params
  #     params.require(:recipe).permit(:name, :preparation-time, :cooking-time, :description, :public)
  #   end
end
