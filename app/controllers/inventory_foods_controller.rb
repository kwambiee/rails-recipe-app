class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(params[:inventory_id]), notice: 'Successfully deleted the food.'
  end


end
