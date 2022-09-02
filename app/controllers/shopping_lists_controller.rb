class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @unlisted_foods = unlisted_foods(params[:recipe_id], params[:inventory_id])
    total = 0
    @unlisted_foods.each { |food| total += food[2] }
    @total = total

  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    respond_to do |format|
      format.html do
        if @shopping_list.save
          # success message
          flash[:success] = 'shopping list saved successfully'
          # redirect to index
          redirect_to shopping_lists_path(recipe_id: shopping_list_params[:recipe_id], inventory_id: shopping_list_params[:inventory_id])
        else
          # error message
          flash.now[:error] = 'Error: shopping list could not be saved'
          # render new
          render :new, locals: { shopping_list: }
        end
      end
    end
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:recipe_id, :inventory_id)
  end

  def unlisted_foods(r_id, i_id)
    inv_food =InventoryFood.joins(:inventory,:food).where(inventory_id: i_id).pluck('foods.id')
    rec_food = RecipeFood.joins(:recipe,:food).where(recipe_id: r_id).pluck('foods.id')
    common_foods = inv_food.concat(rec_food)
    duplicates = common_foods.select { |e| common_foods.count(e) > 1 }.uniq
    InventoryFood.joins(:food).where.not(food_id: duplicates).pluck('foods.name','inventory_foods.quantity','foods.price')

  end
end
