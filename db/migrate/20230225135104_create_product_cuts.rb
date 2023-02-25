class CreateProductCuts < ActiveRecord::Migration[7.0]
  def change
    create_table :product_cuts do |t|
      t.references :cut, null: false, foreign_key: true
      t.references :processed_products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
