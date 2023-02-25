class CreatePieceNames < ActiveRecord::Migration[7.0]
  def change
    create_table :piece_names do |t|
      t.string :name
      t.references :family, null: false, foreign_key: true
      t.string :lot
      t.timestamps
    end
  end
end
