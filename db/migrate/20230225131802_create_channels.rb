class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :income_type
      t.references :family, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.datetime :born_date
      t.datetime :slaughter_date
      t.string :crotal
      t.string :lot
      t.float :weight
      t.float :weight_without_bones
      t.float :weight_bones
      t.float :temperature
      t.decimal :total_value

      t.timestamps
    end
  end
end
