class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = RecipeFood.joins(:recipe, :food).where(recipe: @recipe).pluck('foods.name', 'foods.price', 'recipe_foods.quantity',
                                                                           'recipe_foods.id')
    @inventories = @recipe.user.inventories.pluck(:name, :id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    respond_to do |format|
      format.html do
        if @recipe.save
          # success message
          flash[:success] = 'recipe saved successfully'
          # redirect to index
          redirect_to recipes_path
        else
          # error message
          flash.now[:error] = 'Error: recipe could not be saved'
          # render new
          # render :new, locals: { recipe: }
        end
      end
    end
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
