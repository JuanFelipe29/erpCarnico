class CreateCutNames < ActiveRecord::Migration[7.0]
  def change
    create_table :cut_names do |t|
      t.string :name
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
