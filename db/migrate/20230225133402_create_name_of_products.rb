class CreateNameOfProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :name_of_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
