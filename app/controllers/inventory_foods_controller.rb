class InventoryFoodsController < ApplicationController


   # GET /inventory_foods or /inventory_foods.json
   def index
     @inventory_foods = InventoryFood.all
     
   end

   # GET /inventory_foods/1 or /inventory_foods/1.json
   def show
   end

   # GET /inventory_foods/new
   def new
    @inventory_food = InventoryFood.new
    @inventory = Inventory.find(params[:inventory_id])
    @food_list = Food.all

  end

   # GET /inventory_foods/1/edit
   def edit
   end

   # POST /inventory_foods or /inventory_foods.json
def create
  @inventory = Inventory.find(params[:inventory_id])

  @inventory_food = InventoryFood.new(quantity: inventory_food_params['quantity'].to_i, food_id: inventory_food_params['food_id'], inventory_id: @inventory)

  respond_to do |format|
    if @inventory_food.save
      format.html { redirect_to inventory_path, notice: 'inventory food was successfully created.' }
      format.json { render :show, status: :created, location: @inventory_foods }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @inventory_food.errors, status: :unprocessable_entity }
    end
  end
end

   # PATCH/PUT /inventory_foods/1 or /inventory_foods/1.json
   def update
     respond_to do |format|
       if @inventory_food.update(inventory_food_params)
         format.html { redirect_to inventory_food_url(@inventory_food), notice: "Inventory food was successfully updated." }
         format.json { render :show, status: :ok, location: @inventory_food }
       else
         format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_food.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /inventory_foods/1 or /inventory_foods/1.json
   def destroy
     @inventory_food.destroy

     respond_to do |format|
       format.html { redirect_to inventory_foods_url, notice: "Inventory food was successfully destroyed." }
       format.json { head :no_content }
     end
   end

   private
   # Only allow a list of trusted parameters through.
   def inventory_food_params
     params.require(:inventory_food).permit(:quantity, :inventory_id, :food_id)
   end

 end



