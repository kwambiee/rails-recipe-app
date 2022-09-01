class ShoppingListsController < ApplicationController
  def index
    p params
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    respond_to do |format|
      format.html do
        if @shopping_list.save
          # success message
          flash[:success] = 'shopping list saved successfully'
          # redirect to index
          redirect_to shopping_lists_path(params[:recipe_id])
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
end