class CreateProcessedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :processed_products do |t|
      t.references :name_of_products, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
