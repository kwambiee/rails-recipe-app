class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods = InventoryFood.joins(:inventory, :food).where(inventory: @inventory).pluck('foods.id', 'foods.name', 'inventory_foods.quantity',
                                                                                       'inventory_foods.id')
  end

  def new; end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
    respond_to do |format|
      format.html do
        if @inventory.save
          # success message
          flash[:success] = 'inventory saved successfully'
          # redirect to index
          redirect_to inventories_path
        else
          # error message
          flash.now[:error] = 'Error: inventory could not be saved'
          # render new
          render :new, locals: { inventory: @inventory }
        end
      end
    end
  end

  def destroy
    # Perform the lookup
    @inventory = Inventory.find(params[:id])

    # Destroy/delete the record
    @inventory.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to inventories_path, notice: 'Inventory was removed.' }
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
