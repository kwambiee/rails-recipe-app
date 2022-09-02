class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|

      t.references :user, foreign_key: {to_table: :users}
      t.string :name
      t.string :measurement_unit
      t.float :price


      t.timestamps
    end
  end
end
