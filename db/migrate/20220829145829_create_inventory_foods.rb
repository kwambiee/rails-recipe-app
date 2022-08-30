class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.string :quantity
      t.references :food, null: false, foreign_key: {to_table: :foods }
      t.references :recipe, null: false, foreign_key: {to_table: :recipes}
      t.timestamps
    end
  end
end
