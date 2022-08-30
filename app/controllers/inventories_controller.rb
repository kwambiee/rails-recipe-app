class inventorysController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]

  # GET /inventorys or /inventorys.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventorys/1 or /inventorys/1.json
  def show
    @inventories = Inventory.find(params[:id])
  end

  # GET /inventorys/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventorys/1/edit
  def edit; end

  # POST /inventorys or /inventorys.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: 'inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventorys/1 or /inventorys/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: 'inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorys/1 or /inventorys/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.fetch(:inventory, {})
  end
end
