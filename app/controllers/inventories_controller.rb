class InventoriesController < ApplicationController
  before_action :inventory, only: %i[show edit update destroy]

  def index
    @inventories = Inventory.includes(:user).where(user: current_user.id).all
  end

  def show
    @inventory = inventory.includes(:user, inventory_foods: [:user]).find(params[:id])
    authorize! :read, @inventory
  end

  def create
    inventory = params[:inventory]
    # authorize! :manage, inventory
    # user = User.find(params[:user_id])
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

    def new # rubocop:disable Lint/NestedMethodDefinition
      # authorize! :manage, inventory
      inventory = Inventory.new
      respond_to do |format|
        format.html { render :new, locals: { inventory: } }
      end
    end
  end

  def destroy
    # Perform the lookup
    @inventory_item = Inventory.find(params[:id])

    # Destroy/delete the record
    @inventory_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to inventories_path, notice: 'Inventory was removed.' }
    end
  end
end
