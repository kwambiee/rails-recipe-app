class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
  end

  def create
  @inventory_food = InventoryFood.find(params[:id])



  @inventory_food = InventoryFood.new(food_params)
    if @inventory_food.save
      redirect_to inventory_path(params[:inventory_id]), notice: 'Successfully added the food.'
    else
      render :new, locals: { inventory_food: @inventory_food }
    end

  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(params[:inventory_id]), notice: 'Successfully deleted the food.'
  end

  private
  def food_params
    params.require(:inventory_food).permit(:quantity, :food_id, :inventory_id)
  end
end
