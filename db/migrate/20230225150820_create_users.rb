class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :email_confirmed, default: false
      t.date :email_confirmed_at

      t.timestamps
    end
  end
end
