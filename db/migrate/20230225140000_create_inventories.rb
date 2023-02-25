class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :product_cut, null: false, foreign_key: true
      t.integer :quantity
      t.integer :waste
      t.boolean :available

      t.timestamps
    end
  end
end
