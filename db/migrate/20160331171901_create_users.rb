class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :email, null: false, unique: true
      t.string :session_token

      t.timestamps null: false
    end
  end
end
