class CreateCuts < ActiveRecord::Migration[7.0]
  def change
    create_table :cuts do |t|
      t.references :piece, null: false, foreign_key: true
      t.references :cut_name, null: false, foreign_key: true
      t.date :start_date_maturation
      t.date :end_date_maturation
      t.boolean :maturing
      t.boolean :available
      t.references :cut_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
