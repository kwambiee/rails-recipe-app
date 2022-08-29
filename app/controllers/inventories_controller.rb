class InventoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @inventories = Inventory.includes(:user).where(user: params[:user_id])
  end

  def show
    @inventory = inventory.includes(:user, inventory_foods: [:user]).find(params[:id])
    authorize! :read, @inventory
  end

  def create # rubocop:disable Metrics/MethodLength
    authorize! :read, inventory
    inventory = params[:inventory]
    user = User.find(params[:user_id])
    inventory = Inventory.new(inventory.permit(:name, :description))
    inventory.user_id = user.id
    respond_to do |format|
      format.html do
        if inventory.save
          # success message
          flash[:success] = 'inventory saved successfully'
          # redirect to index
          redirect_to "/inventories"
        else
          # error message
          flash.now[:error] = 'Error: inventory could not be saved'
          # render new
          render :new, locals: { inventory: }
        end
      end
    end

    def new # rubocop:disable Lint/NestedMethodDefinition
      authorize! :manage, inventory
      inventory = Inventory.new
      respond_to do |format|
        format.html { render :new, locals: { inventory: } }
      end
    end
  end
end
