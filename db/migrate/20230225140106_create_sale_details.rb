class CreateSaleDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_details do |t|
      t.references :sales, null: false, foreign_key: true
      t.references :product_cut, null: false, foreign_key: true
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
  end
end
