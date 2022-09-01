class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
     @foods = InventoryFood.joins(:inventory, :food).where(inventory: @inventory).pluck('foods.name','inventory_foods.quantity', 'inventory_foods.id')
  end

  def create
    inventory = params[:inventory]
    inventory = Inventory.new(inventory.permit(:name, :description))
    inventory.user_id = current_user.id
    respond_to do |format|
      format.html do
        if inventory.save
          # success message
          flash[:success] = 'inventory saved successfully'
          # redirect to index
          redirect_to inventories_path
        else
          # error message
          flash.now[:error] = 'Error: inventory could not be saved'
          # render new
          render :new, locals: { inventory: }
        end
      end
    end
  end

  def new
    # authorize! :manage, inventory
    inventory = Inventory.new
    respond_to do |format|
      format.html { render :new, locals: { inventory: } }
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
end
